//
//  CellAnimaitonCell.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/5/27.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "CellAnimaitonCell.h"
#import "Masonry.h"

@interface CellAnimaitonCell ()


@end

@implementation CellAnimaitonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setCellAniMainView];
    }
    return self;
}

-(void)setCellAniMainView{
    

    self.backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    
    self.backImageView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.backImageView];

    [self.backImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
