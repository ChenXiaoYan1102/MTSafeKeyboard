//
//  UITextField+MTSecurity.m
//  Demo
//
//  Created by APPLE on 2021/6/7.
//  Copyright © 2021 MT. All rights reserved.
//

#import <MTSafeKeyboard/UITextField+MTSecurity.h>
#import <MTSafeKeyboard/MTTextFieldConst.h>

#import <objc/runtime.h>

static const void *xjSecurityKey = &xjSecurityKey;
static const void *xjIsEncryptKey = &xjIsEncryptKey;

@implementation UITextField (MTSecurity)

#pragma mark - Setter & Getter
- (void)setSecurityText:(NSString *)securityText {
    
    objc_setAssociatedObject(self, xjSecurityKey, securityText, OBJC_ASSOCIATION_COPY);
}

- (NSString *)securityText {
    
    NSString *string = objc_getAssociatedObject(self, xjSecurityKey);
    if (!string || string.length == 0) {
        
        return @"";
    }
    
    return  string;
}

- (void)setIsEncryptText:(BOOL)isEncryptText {
    
    objc_setAssociatedObject(self, xjIsEncryptKey, @(isEncryptText), OBJC_ASSOCIATION_ASSIGN);
    
    [self refreshTextField];
}

- (BOOL)isEncryptText {
    
    NSNumber *num = objc_getAssociatedObject(self, xjIsEncryptKey);
    
    return [num boolValue];
}

#pragma mark - 添加或删除之后，必须刷新一下，否则显示会有问题
- (void)refreshTextField {
    BOOL flag = self.isEncryptText;
    if (!flag) {
        self.securityText = self.text;
    } else {
        NSMutableString *string = [NSMutableString stringWithString:@""];
        NSUInteger length = self.text.length;
        for (NSInteger idx = 0; idx < length; idx++) {
            [string appendString:ASTERISK];
        }

        self.securityText = string;
    }
}

@end
