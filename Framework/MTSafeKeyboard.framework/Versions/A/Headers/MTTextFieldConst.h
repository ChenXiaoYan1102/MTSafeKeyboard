//
//  MTTextFieldConst.h
//  Demo
//
//  Created by APPLE on 2021/6/7.
//  Copyright © 2021 MT. All rights reserved.
//

#ifndef MTTextFieldConst_h
#define MTTextFieldConst_h

//RGB
#define kRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

#define ASTERISK @"•"
#define WHITESPACE @" "

#define KEYBOARD_TYPE_LETTER @"Abc"
#define KEYBOARD_TYPE_CHARACTER @"#+="
#define KEYBOARD_TYPE_NUMBER @"12."
#define KEYBOARD_TYPE_DIGITAL @"123"

#define NUMBERS @"1234567890"
#define LETTERS @"qwertyuiopasdfghjklzxcvbnm"
#define SPECIAL_CHARACTERS @"!@#$%^&*()'\"=_:;?~|`+-\\/[]{},.<>"
#define POT @"."
#define ALT @"alt"
#define PLACE_PLACER @""
#define SPACE_STRING MTLocalizedString(@"空格")
#define DELETE_STRING MTLocalizedString(@"删除")
#define FINISH_STRING MTLocalizedString(@"完成")
#define TITLE_STRING MTLocalizedString(@"安全键盘")
#define OUT_OF_LIMIT_TIP_STRING MTLocalizedString(@"长度超出限制")

#define SEPERATE_SPACE 5.0
#define LETTER_ITEM_WIDTH ((CGRectGetWidth([UIScreen mainScreen].bounds) - SEPERATE_SPACE * 11) / 10.0)
#define NUMBER_ITEM_WIDTH ((CGRectGetWidth([UIScreen mainScreen].bounds) - SEPERATE_SPACE * 4) / 3)
#define ITEM_HEIGHT (LETTER_ITEM_WIDTH * 4 / 3)
#define KEYBOARD_BACKGROUND_COLOR kRGBA(235, 238, 243, 1)
#define KEYBOARD_ITEM_COLOR [UIColor whiteColor]
#define KEYBOARD_SPECIAL_ITEM_DARK_COLOR kRGBA(219, 223, 241, 1)
#define KEYBOARD_KEY_COLOR kRGBA(51, 51, 51, 1)
#define KEYBOARD_KEY_FONT [UIFont systemFontOfSize:22]

typedef NS_OPTIONS(NSUInteger, MTCustomKeyboardType) {
    MTCustomKeyboardTypeLetter = 1 << 0, //字母
    MTCustomKeyboardTypeCharacters = 1 << 1, //符号
    MTCustomKeyboardTypeDecimalPad = 1 << 2, //带小数
    MTCustomKeyboardTypeNumberPad = 1 << 3, //纯数字
    MTCustomKeyboardTypeMT = MTCustomKeyboardTypeLetter | MTCustomKeyboardTypeCharacters | MTCustomKeyboardTypeDecimalPad,
    MTCustomKeyboardTypeAll = MTCustomKeyboardTypeLetter | MTCustomKeyboardTypeCharacters | MTCustomKeyboardTypeDecimalPad | MTCustomKeyboardTypeNumberPad
};

#endif /* MTTextFieldConst_h */
