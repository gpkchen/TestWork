//
//  UIButton+BezierAnimation.h
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/22.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BezierAnimation)


//label 上的数字  从某一个值变化到 另一个值  －  （动画） －

- (void)animationFromnum:(float )fromNum toNum:(float )toNum duration:(float )duration;

@end
