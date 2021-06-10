//
//  MTSafeKeyboardHelper.m
//  MTSafeKeyboard
//
//  Created by APPLE on 2021/6/10.
//  Copyright © 2021 MT. All rights reserved.
//

#import "MTSafeKeyboardHelper.h"

NSBundle *mtsafekeyboard_resourceBundle(Class class) {
    static NSBundle *MTSafeKeyboardBundle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MTSafeKeyboardBundle = [NSBundle bundleForClass:class];
        if (MTSafeKeyboardBundle) {
            NSString *resourceBundlePath = [MTSafeKeyboardBundle pathForResource:@"MTSafeKeyboardBundle" ofType:@"bundle"];
            if (resourceBundlePath && [[NSFileManager defaultManager] fileExistsAtPath:resourceBundlePath]) {
                MTSafeKeyboardBundle = [NSBundle bundleWithPath:resourceBundlePath];
            }
        }
    });
    return MTSafeKeyboardBundle;
}

@implementation MTSafeKeyboardHelper

+ (NSString *)localizedStringForKey:(NSString *)key {
    
    return [mtsafekeyboard_resourceBundle([self class]) localizedStringForKey:(key) value:@"" table:nil];
}

+ (UIImage *)imageNamed:(NSString *)name {
    
    return [UIImage imageNamed:name inBundle:mtsafekeyboard_resourceBundle([self class]) compatibleWithTraitCollection:nil];
}

@end
