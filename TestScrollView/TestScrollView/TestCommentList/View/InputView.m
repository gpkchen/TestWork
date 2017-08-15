//
//  InputView.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/3.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "InputView.h"


@interface InputView ()

/**
 * 文本输入框
 */
@property (nonatomic, strong)UITextView     *inputTextView;


/**
 *😊发送按钮
 */

@property (nonatomic, strong)UIButton       *sendButton;


/**
 * 站位文本
 */
@property (nonatomic, weak)UITextView     *placeholderView;


/**
 *  文字高度
 */
@property (nonatomic, assign) NSInteger textH;

/**
 *  文字最大高度
 */
@property (nonatomic, assign) NSInteger maxTextH;


@end


@implementation InputView

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark --- initView
- (void)initView{
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = KColor_Gray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@(1.2));
    }];
    
    
    [self addSubview:self.inputTextView];
    [self addSubview:self.sendButton];
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10*kMainScaleMiunes);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(40*kMainScaleMiunes, 35*kMainScaleMiunes));
    }];
    
    
    [self.inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10*kMainScaleMiunes);
        make.right.equalTo(self.sendButton.mas_left).offset(-10*kMainScaleMiunes);
        make.height.equalTo(self.sendButton);
    }];
    
}


#pragma mark --- getter

- (UIButton *)sendButton{
    if (!_sendButton) {
        
        _sendButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_sendButton setImage:[UIImage imageNamed:@"send_comment"] forState:(UIControlStateNormal)];
        [_sendButton addTarget:self action:@selector(sendButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_sendButton.layer setCornerRadius:3.f];
        [_sendButton.layer setMasksToBounds:YES];
        
    }
    return _sendButton;
}


- (UITextView *)inputTextView{
    if (!_inputTextView) {
        
        _inputTextView = [[UITextView alloc] init];
        _inputTextView.scrollEnabled = NO;
        _inputTextView.scrollsToTop = NO;
        _inputTextView.showsHorizontalScrollIndicator = NO;
        _inputTextView.enablesReturnKeyAutomatically = YES;
        _inputTextView.layer.borderWidth = 1;
        _inputTextView.layer.cornerRadius = 5;
        _inputTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [[NSNotificationCenter defaultCenter] addObserver:self.inputTextView selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
    }
    return _inputTextView;
}

- (UITextView *)placeholderView
{
    if (_placeholderView == nil) {
        UITextView *placeholderView = [[UITextView alloc] init];
        _placeholderView = placeholderView;
        _placeholderView.scrollEnabled = NO;
        _placeholderView.showsHorizontalScrollIndicator = NO;
        _placeholderView.showsVerticalScrollIndicator = NO;
        _placeholderView.userInteractionEnabled = NO;
        _placeholderView.font = self.inputTextView.font;
        _placeholderView.textColor = [UIColor lightGrayColor];
        _placeholderView.backgroundColor = [UIColor clearColor];
        [self addSubview:placeholderView];
    }
    return _placeholderView;
}


#pragma mark --- setter

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderView.textColor = placeholderColor;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    self.placeholderView.text = placeholder;
}

- (void)setYz_textHeightChangeBlock:(void (^)(NSString *, CGFloat))yz_textChangeBlock
{
    _yz_textHeightChangeBlock = yz_textChangeBlock;
    
    [self textDidChange];
}

#pragma mark -- orther

- (void)sendButtonAction:(UIButton *)sender{
    
    
}


- (void)textDidChange
{
    // 占位文字是否显示
    self.placeholderView.hidden = self.inputTextView.text.length > 0;
    
    NSInteger height = ceilf([self sizeThatFits:CGSizeMake(self.bounds.size.width, MAXFLOAT)].height);
    
    if (_textH != height) { // 高度不一样，就改变了高度
        
        // 最大高度，可以滚动
        self.inputTextView.scrollEnabled = height > _maxTextH && _maxTextH > 0;
        
        _textH = height;
        
        if (_yz_textHeightChangeBlock && self.inputTextView.scrollEnabled == NO) {
            _yz_textHeightChangeBlock(self.inputTextView.text,height);
            [self.superview layoutIfNeeded];
            self.placeholderView.frame = self.bounds;
        }
    }
}
@end
