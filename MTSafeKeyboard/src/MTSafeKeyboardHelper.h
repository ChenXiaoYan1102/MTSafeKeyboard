//
//  MTSafeKeyboardHelper.h
//  MTSafeKeyboard
//
//  Created by APPLE on 2021/6/10.
//  Copyright © 2021 MT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXTERN NSBundle *mtsafekeyboard_resourceBundle(Class class);

#define MTLocalizedString(key) \
[MTSafeKeyboardHelper localizedStringForKey:key]

#define MTLocalizedImage(key) \
[MTSafeKeyboardHelper imageNamed:key]

@interface MTSafeKeyboardHelper : NSObject

+ (NSString *)localizedStringForKey:(NSString *)key;

+ (UIImage *)imageNamed:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
