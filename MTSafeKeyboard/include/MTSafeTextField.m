//
//  MTSafeTextField.m
//  Demo
//
//  Created by APPLE on 2021/6/7.
//  Copyright © 2021 MT. All rights reserved.
//

#import <MTSafeKeyboard/MTSafeTextField.h>
#import <MTSafeKeyboard/UITextField+MTSecurity.h>
#import <MTSafeKeyboard/MTTextFieldConst.h>

#import <objc/runtime.h>

@interface MTSafeTextField ()

@end

@implementation MTSafeTextField

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzlingWithClass:[MTSafeTextField class] oriSEL:@selector(setText:) swizzledSEL:@selector(setSecurityText:)];
        [self swizzlingWithClass:[MTSafeTextField class] oriSEL:@selector(text) swizzledSEL:@selector(securityText)];
    });
}

+ (void)swizzlingWithClass:(Class)cls
                    oriSEL:(SEL)oriSEL
               swizzledSEL:(SEL)swizzledSEL{
    
    if (!cls) NSLog(@"传入的交换类不能为空");
    // oriSEL       personInstanceMethod
    // swizzledSEL  lg_studentInstanceMethod
    Method oriMethod = class_getInstanceMethod(cls, oriSEL);
    Method swiMethod = class_getInstanceMethod(cls, swizzledSEL);
    //加一层保护措施，如果添加成功，则表示该方法不存在于本类，而是存在于父类中，不能交换父类的方法,否则父类的对象调用该方法会crash；添加失败则表示本类存在该方法
    BOOL success = class_addMethod(cls, oriSEL, method_getImplementation(swiMethod), method_getTypeEncoding(oriMethod));
    if (success) {// 自己没有 - 交换 - 没有父类进行处理 (重写一个)
        //再将原有的实现替换到swizzledMethod方法上，从而实现方法的交换，并且未影响到父类方法的实现
        class_replaceMethod(cls, swizzledSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else { // 自己有
        method_exchangeImplementations(oriMethod, swiMethod);
    }
}

#pragma mark -
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    return NO;
}

#pragma mark - Setter & Getter
- (void)setText:(NSString *)text {
    
    [super setText:text];
}

- (NSString *)text {
    
    return [super text];
}

@end
