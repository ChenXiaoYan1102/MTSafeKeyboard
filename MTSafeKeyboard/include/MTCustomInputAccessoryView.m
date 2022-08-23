//
//  MTCustomInputAccessoryView.m
//  Demo
//
//  Created by APPLE on 2021/6/7.
//  Copyright © 2021 MT. All rights reserved.
//

#import <MTSafeKeyboard/MTCustomInputAccessoryView.h>
#import <MTSafeKeyboard/MTTextFieldConst.h>

#import <Masonry/Masonry.h>

#import "MTSafeKeyboardHelper.h"

@interface MTCustomInputAccessoryView ()

@property (nonatomic, copy) NSArray *keyboardTitles;

@property (nonatomic, assign) MTCustomKeyboardType keyboardType;

//左边切换按钮
@property (nonatomic, strong) UIButton *changeTypeButton;

//中间显示文字
@property (nonatomic, strong) UILabel *textLabel;

//右边完成按钮
@property (nonatomic, strong) UIButton *finishButton;

//底部分割线
@property (nonatomic, strong) UIView *line;

@end

@implementation MTCustomInputAccessoryView

- (instancetype)initWithFrame:(CGRect)frame keyboardType:(MTCustomKeyboardType)type {
    if (self = [super initWithFrame:frame]) {
        self.keyboardType = type;
        self.backgroundColor = kRGBA(235, 238, 243, 1);
        
        if (self.keyboardTitles.count > 1) {
            [self.changeTypeButton setTitle:self.keyboardTitles[1] forState:UIControlStateNormal];
            self.changeTypeButton.hidden = NO;
        }

        [self.finishButton setTitle:FINISH_STRING forState:UIControlStateNormal];
        
        [self bringSubviewToFront:self.line];
    }
    
    return self;
}

#pragma mark - Private
- (MTCustomKeyboardType)keyboardFromString:(NSString *)title {
    if ([title isEqualToString:KEYBOARD_TYPE_LETTER]) {
        return MTCustomKeyboardTypeLetter;
    } else if ([title isEqualToString:KEYBOARD_TYPE_CHARACTER]){
        return MTCustomKeyboardTypeCharacters;
    } else if ([title isEqualToString:KEYBOARD_TYPE_NUMBER]){
        return MTCustomKeyboardTypeDecimalPad;
    } else if ([title isEqualToString:KEYBOARD_TYPE_DIGITAL]){
        return MTCustomKeyboardTypeNumberPad;
    } else{
        return MTCustomKeyboardTypeLetter;
    }
}
#pragma mark - Button Action
- (void)changeTypeAction:(UIButton *)sender {
    NSString *text = [sender titleForState:UIControlStateNormal];
    NSInteger idx = [self.keyboardTitles indexOfObject:text];
    NSInteger currentIdx = (idx +1) % self.keyboardTitles.count;
    [self.changeTypeButton setTitle:self.keyboardTitles[currentIdx] forState:UIControlStateNormal];
    if (self.changeTypeBlock) {
        self.changeTypeBlock([self keyboardFromString:text]);
    }
}

- (void)finishAction:(UIButton *)sender{
    if (self.finishBlock) {
        self.finishBlock();
    }
}

#pragma mark - Lazy load
- (UIButton *)changeTypeButton {
    if (!_changeTypeButton) {
        _changeTypeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_changeTypeButton setTitleColor:kRGBA(51,51,51,1) forState:UIControlStateNormal];
        _changeTypeButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _changeTypeButton.hidden = YES;
        [_changeTypeButton addTarget:self action:@selector(changeTypeAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_changeTypeButton];
        [_changeTypeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.bottom.equalTo(self);
            make.width.mas_equalTo(60);
        }];
    }
    
    return  _changeTypeButton;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel =[[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:15];
        _textLabel.textColor = kRGBA(51,51,51,1);
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textLabel];
        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.centerX.equalTo(self);
            make.leading.equalTo(self.changeTypeButton.mas_trailing).offset(5);
            make.trailing.equalTo(self.finishButton.mas_leading).offset(-5);
        }];
    }
    
    return _textLabel;
}

- (UIButton *)finishButton {
    if (!_finishButton) {
        _finishButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [_finishButton setTitleColor:kRGBA(3, 73, 166, 1) forState:UIControlStateNormal];
        [_finishButton setTitleColor:kRGBA(3, 73, 166, 1) forState:UIControlStateHighlighted];
        _finishButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_finishButton addTarget:self action:@selector(finishAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_finishButton];
        [_finishButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.trailing.equalTo(self);
            make.width.mas_equalTo(60);
        }];
    }
 
    return _finishButton;
}

- (NSArray *)keyboardTitles {
    if (!_keyboardTitles) {
        NSMutableArray *titles = [NSMutableArray array];
        if (self.keyboardType & MTCustomKeyboardTypeLetter) {
            [titles addObject:KEYBOARD_TYPE_LETTER];
        }
        if (self.keyboardType & MTCustomKeyboardTypeDecimalPad) {
            [titles addObject:KEYBOARD_TYPE_NUMBER];
        }
        if (self.keyboardType & MTCustomKeyboardTypeNumberPad) {
            [titles addObject:KEYBOARD_TYPE_DIGITAL];
        }
        if (self.keyboardType & MTCustomKeyboardTypeCharacters) {
            [titles addObject:KEYBOARD_TYPE_CHARACTER];
        }
        _keyboardTitles = [NSArray arrayWithArray:titles];
    }
    
    return _keyboardTitles;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = kRGBA(217, 217, 217, 1);
        [self addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.bottom.trailing.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
    }
    
    return _line;
}

@end
