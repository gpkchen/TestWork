//
//  NSString+StringSize.m
//  J-nife
//
//  Created by Tesla_Chen on 2017/4/13.
//  Copyright © 2017年 JDL. All rights reserved.
//

#import "NSString+StringSize.h"

@implementation NSString (NSString_StringSize)

- (CGSize)jnife_stringSizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight
{
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    CGSize maxSize = CGSizeMake(maxWidth, maxHeight);
    attr[NSFontAttributeName] = font;
    return [self boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size;
    
}

- (CGSize)jnife_stringSizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth
{
    return [self jnife_stringSizeWithFont:font maxWidth:maxWidth maxHeight:MAXFLOAT];
}

- (CGSize)jnife_stringSizeWithFont:(UIFont *)font
{
    return [self jnife_stringSizeWithFont:font maxWidth:MAXFLOAT maxHeight:MAXFLOAT];
}


@end
