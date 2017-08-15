//
//  HCTextView.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/10.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "HCTextView.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width

#define WIDTH  ScreenWidth/375

@implementation HCTextView


{
    
    float _currentLineNum;
    
}

- (instancetype)initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0XE6E6E6);
        
        _currentLineNum=1;//默认文本框显示一行文字
        
        [self addSubviews];
        
    }
    
    return self;
    
}

- (void)addSubviews{
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = KColor_Gray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.equalTo(@(1.2));
    }];
    
    self.commentField = [[UITextView alloc]init];
    
    self.commentField.backgroundColor = UIColorFromRGB(0Xf8f8f8);
    
    self.commentField.font = [UIFont systemFontOfSize:14*kMainScaleMiunes];
    
    self.commentField.text = @"｜说说你的看法～";
    
    self.commentField.textColor = UIColorFromRGB(0Xa0a0a0);
    
    self.commentField.layer.cornerRadius = 4;
    
    self.commentField.layer.masksToBounds = YES;
    
    [self addSubview:self.commentField];
    
    self.commentField.contentInset = UIEdgeInsetsMake(-66,0,0,0);
    
    self.commentField.delegate = self;
    
    [self addSubview:self.publishBtn];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    
    [self addSubview:self.commentField];
    [self addSubview:self.publishBtn];
    
    [self.publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10*kMainScaleMiunes);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(40*kMainScaleMiunes, 35*kMainScaleMiunes));
    }];
    
    
    [self.commentField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5*kMainScaleMiunes);
        make.left.equalTo(self).offset(10*kMainScaleMiunes);
        make.right.equalTo(self.publishBtn.mas_left).offset(-10*kMainScaleMiunes);
        make.height.greaterThanOrEqualTo(@35);

    }];
    
}


- (UIButton *)publishBtn{
    if (!_publishBtn) {
        
        _publishBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_publishBtn setImage:[UIImage imageNamed:@"send_comment"] forState:(UIControlStateNormal)];
        [_publishBtn addTarget:self action:@selector(sendButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_publishBtn.layer setCornerRadius:3.f];
        [_publishBtn.layer setMasksToBounds:YES];
        
    }
    return _publishBtn;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    if ([textView.text isEqualToString:@"｜说说你的看法～"]) {
        
        textView.text = @"";
        
        self.commentField.textColor = UIColorFromRGB(0X646464);
        
        self.commentField.contentInset = UIEdgeInsetsMake(2,0,-2,0);
        
    }
    
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    if (textView.text.length<1) {
        
        textView.text = @"｜说说你的看法～";
        
        textView.textColor = UIColorFromRGB(0Xa0a0a0);
        
    }
    
    self.commentField.contentInset = UIEdgeInsetsMake(2,0,-2,0);
    
}

-(void)textViewDidChange:(UITextView *)textView{
    
    float textViewWidth=textView.frame.size.width;//取得文本框高度
    
    NSString *content=textView.text;
    
    NSDictionary *dict=@{NSFontAttributeName:[UIFont systemFontOfSize:14.0*kMainScaleMiunes]};
    
    CGSize contentSize=[content sizeWithAttributes:dict];//计算文字长度
    
    float numLine=ceilf(contentSize.width/textViewWidth); //计算当前文字长度对应的行数
    
    if (numLine>10) {
        
        numLine=10;
        
    }
    
    CGFloat heightText = 14;
    
    if (numLine != 0) {
        
        if (numLine>_currentLineNum) {
            
            self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y-heightText*(numLine-_currentLineNum), ScreenWidth, self.frame.size.height+heightText*(numLine-_currentLineNum));
            
            
            [self.commentField mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.height.equalTo(@(self.commentField.frame.size.height+heightText*(numLine-_currentLineNum)));
                
            }];
            
            _currentLineNum=numLine;
            
        }else if(numLine<_currentLineNum){
            
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y-heightText*(numLine-_currentLineNum), ScreenWidth, self.frame.size.height+heightText*(numLine-_currentLineNum));
            
            [self.commentField mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.height.equalTo(@(self.commentField.frame.size.height+heightText*(numLine-_currentLineNum)));
                
            }];
            
            _currentLineNum=numLine;
            
        }
        
    }
     
    
}

- (void)sendButtonAction:(UIButton *)sender{
    
}

@end
