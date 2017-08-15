//
//  CommentListCell.h
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/3.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentMdeol.h"

typedef void(^CommentBlock)(NSString *);

@interface CommentListCell : UITableViewCell

@property (nonatomic, copy) CommentBlock        commentBlock;

@property (nonatomic, strong)CommentMdeol       *commentmodel;

@end
