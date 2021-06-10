//
//  MTKeyboardCollectionViewCell.m
//  Demo
//
//  Created by APPLE on 2021/6/7.
//  Copyright © 2021 MT. All rights reserved.
//

#import <MTSafeKeyboard/MTKeyboardCollectionViewCell.h>
#import <MTSafeKeyboard/MTTextFieldConst.h>

#import <Masonry/Masonry.h>

@implementation MTKeyboardCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor darkTextColor];
        
        self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        NSArray *constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_textLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_textLabel)];
        NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_textLabel]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_textLabel)];
        [self addConstraints:constraints1];
        [self addConstraints:constraints2];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
    }
    
    return self;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = KEYBOARD_KEY_COLOR;
        _textLabel.font = KEYBOARD_KEY_FONT;
        _textLabel.adjustsFontSizeToFitWidth = YES;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textLabel];
    }
    
    return _textLabel;
}

@end
