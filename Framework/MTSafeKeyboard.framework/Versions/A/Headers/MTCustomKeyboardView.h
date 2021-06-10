//
//  MTCustomKeyboardView.h
//  Demo
//
//  Created by APPLE on 2021/6/7.
//  Copyright © 2021 MT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MTSafeKeyboard/MTTextFieldConst.h>
#import <MTSafeKeyboard/MTCustomInputAccessoryView.h>

NS_ASSUME_NONNULL_BEGIN

/*
 说明：
 1、- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string方法无法监听到，因此创建和系统方法同名的方法，设置代理后，可监听字符串变化
 
 2、本类请配合MTSafeTextField类使用，如需要自定义输入源，需要继承UITextField，重写text的get和set方法
 */

@protocol MTCustomKeyboardViewDelegate <NSObject>

@optional

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

//长度超出限制提示
- (void)textField:(UITextField *)textField lengthOutOfLimitTip:(NSString *)tip;

@end

@interface MTCustomKeyboardView : UIView <UIInputViewAudioFeedback>

//背景颜色
@property (nonatomic, strong) UIColor *keyboardBackgroundColor;
//键盘背景颜色
@property (nonatomic, strong) UIColor *keyboardItemColor;
//键盘背景深色 特殊按钮背景色
@property (nonatomic, strong) UIColor *currentItemDarkColor;
//键盘颜色
@property (nonatomic, strong) UIColor *currentKeyColor;
//字体
@property (nonatomic, strong) UIFont *currentKeyFont;
//accessoryColor
@property (nonatomic, strong) UIColor *accessoryColor;
//accessoryFont
@property (nonatomic, strong) UIFont *accessoryFont;

@property (nonatomic, weak) id <MTCustomKeyboardViewDelegate> delegate;

/**
 实例方法

 @param view textField
 @param keyboardType 键盘
 @return 实例
 */
+ (instancetype)configWithView:(UIView<UIKeyInput> *)view
                  keyboardType:(MTCustomKeyboardType)keyboardType;

/**
 实例方法

 @param view textField
 @param keyboardType 键盘
 @param random 是否随机
 @return 实例
 */
+ (instancetype)configWithView:(UIView<UIKeyInput> *)view
                  keyboardType:(MTCustomKeyboardType)keyboardType
                        random:(BOOL)random;

/**
 实例方法

 @param view textField
 @param keyboardType 键盘
 @param random 是否随机
 @param title 键盘标题
 @return 实例
 */
+ (instancetype)configWithView:(UIView<UIKeyInput> *)view
                  keyboardType:(MTCustomKeyboardType)keyboardType
                        random:(BOOL)random
                         title:(NSString *)title;

/**
 实例方法

 @param view textField
 @param keyboardType 键盘
 @param random 是否随机
 @param title 键盘标题
 @param length 是否限制长度,不限制传-1
 @return 实例
 */
+ (instancetype)configWithView:(UIView<UIKeyInput> *)view
                  keyboardType:(MTCustomKeyboardType)keyboardType
                        random:(BOOL)random
                         title:(NSString *)title
                        length:(NSInteger)length;
@end

NS_ASSUME_NONNULL_END
