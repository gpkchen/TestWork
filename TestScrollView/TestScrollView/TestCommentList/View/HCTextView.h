//
//  HCTextView.h
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/10.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCTextView : UIView <UITextViewDelegate>

@property (nonatomic, strong)UITextView     *commentField;

@property (nonatomic, strong)UIButton       *publishBtn;

@end
