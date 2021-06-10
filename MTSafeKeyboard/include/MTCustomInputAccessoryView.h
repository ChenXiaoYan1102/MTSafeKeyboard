//
//  MTCustomInputAccessoryView.h
//  Demo
//
//  Created by APPLE on 2021/6/7.
//  Copyright © 2021 MT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MTSafeKeyboard/MTTextFieldConst.h>

typedef void(^MTCustomInputAccessoryViewChangeTypeBlock)(MTCustomKeyboardType type);

typedef void(^MTCustomInputAccessoryViewFinishBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface MTCustomInputAccessoryView : UIView

//左边切换按钮
@property (nonatomic, strong, readonly) UIButton *changeTypeButton;

//中间显示文字
@property (nonatomic, strong, readonly) UILabel *textLabel;

//右边完成按钮
@property (nonatomic, strong, readonly) UIButton *finishButton;

@property (nonatomic, copy) MTCustomInputAccessoryViewChangeTypeBlock changeTypeBlock;

@property (nonatomic, copy) MTCustomInputAccessoryViewFinishBlock finishBlock;

- (instancetype)initWithFrame:(CGRect)frame keyboardType:(MTCustomKeyboardType)type;

@end

NS_ASSUME_NONNULL_END
