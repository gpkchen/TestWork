//
//  NSString+StringSize.h
//  J-nife
//
//  Created by Tesla_Chen on 2017/4/13.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface   NSString (NSString_StringSize)

- (CGSize)jnife_stringSizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight;
- (CGSize)jnife_stringSizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;
- (CGSize)jnife_stringSizeWithFont:(UIFont *)font;

@end
