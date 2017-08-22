//
//  JnifeGradeView.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/22.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "JnifeGradeView.h"
#import "UIButton+BezierAnimation.h"

@interface JnifeGradeView ()

@property (copy,nonatomic) UIButton         *gradeButton;


@end

@implementation JnifeGradeView


- (instancetype)init{
    self = [super init];
    if (self) {
        [self initView];
        
        self.backgroundColor = [KColor_Clear colorWithAlphaComponent:.6];
        
    }
    return self;
}

#pragma mark --- InitView

- (void)initView{
    
    [self addSubview:self.gradeButton];
    
    [self.gradeButton  mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    
    
}


#pragma mark --- lazy load

- (UIButton *)gradeButton {
    if (!_gradeButton) {
        
        _gradeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_gradeButton setImage:[UIImage imageNamed:@"vip"] forState:(UIControlStateNormal)];
        [_gradeButton setBackgroundColor:[UIColor darkGrayColor]];
        [_gradeButton addTarget:self action:@selector(gradeButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
        [_gradeButton.layer setCornerRadius:15];
        [_gradeButton.layer setMasksToBounds:YES];
        
    }
    return _gradeButton;
}


#pragma mark --- orther Action

- (void)gradeButtonAction{
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.35 initialSpringVelocity:0.9 options:
     UIViewAnimationOptionCurveLinear animations:^{
         
         CGRect tempRect = self.gradeButton.frame;
         
         tempRect = CGRectMake(self.gradeButton.frame.origin.x, self.gradeButton.frame.origin.y, self.gradeButton.frame.size.width + 9, 30);
         
         [self.gradeButton setFrame:tempRect];
         [self.gradeButton setCenter:self.center];
         
     } completion:^(BOOL finished) {
         
         
         
     }];
    
}


#pragma mark --- setter

- (void)setTitle:(NSString *)title{
    _title = title;
    
    
//    [self.gradeButton setTitle:title forState:(UIControlStateNormal)];
    
    [self.gradeButton animationFromnum:0 toNum:[title floatValue] duration:2.f];
    
}


@end
