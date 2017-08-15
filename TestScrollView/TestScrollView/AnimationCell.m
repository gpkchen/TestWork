//
//  AnimationCell.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/6/23.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "AnimationCell.h"

@implementation AnimationCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setAnimationCellView];
    }
    return self;
}

-(void)setAnimationCellView{
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    [self.contentView addSubview:_backImageView];
    [_backImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(5, 0, 5, 0));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
