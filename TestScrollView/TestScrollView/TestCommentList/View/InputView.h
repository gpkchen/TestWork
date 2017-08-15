//
//  InputView.h
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/3.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputView : UIView


/**
 *  文字高度改变block → 文字高度改变会自动调用
 *  block参数(text) → 文字内容
 *  block参数(textHeight) → 文字高度
 */
@property (nonatomic, strong) void(^yz_textHeightChangeBlock)(NSString *text,CGFloat textHeight);

@property (nonatomic, strong)UIFont         *font;

/**
 *  占位文字
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 *  占位文字颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
