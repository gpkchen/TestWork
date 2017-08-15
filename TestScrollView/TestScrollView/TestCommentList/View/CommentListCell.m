//
//  CommentListCell.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/3.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "CommentListCell.h"

@interface CommentListCell ()

@property (nonatomic, strong)UILabel        *nameLabel;
@property (nonatomic, strong)UILabel        *timeLabel;
@property (nonatomic, strong)UILabel        *contentLabel;
@property (nonatomic, strong)UIImageView    *iconIamgeView;
@property (nonatomic, strong)UIButton       *commentBut;


@end


@implementation CommentListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCommentListCellView];
        [self setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    }
    return self;
}

- (void)initCommentListCellView{
    
   
    
    [self.contentView addSubview:self.iconIamgeView];

    [self.contentView addSubview:self.nameLabel];

    [self.contentView addSubview:self.timeLabel];
    
    [self.contentView addSubview:self.contentLabel];
    
    [self.contentView addSubview:self.commentBut];
    
    [self.iconIamgeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20*kMainScaleMiunes);
        make.left.equalTo(self.contentView).offset(10*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(30*kMainScaleMiunes, 30*kMainScaleMiunes));
    }];
    
    [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconIamgeView);
        make.left.equalTo(self.iconIamgeView.mas_right).offset(10*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(200*kMainScaleMiunes, 13*kMainScaleMiunes));
    }];
    
    [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(25*kMainScaleMiunes);
        make.right.equalTo(self.contentView).offset(-10*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(55*kMainScaleMiunes, 11*kMainScaleMiunes));
    }];
    
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10*kMainScaleMiunes);
        make.left.equalTo(self.nameLabel);
        make.right.equalTo(self.timeLabel.mas_left);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20*kMainScaleMiunes);
    }];
    
    [self.commentBut mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView).offset(-10*kMainScaleMiunes);
        make.bottom.equalTo(self.contentView).offset(-10*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(29*kMainScaleMiunes, 17*kMainScaleMiunes));
        
    }];
}


#pragma mark  --- Getter

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setBackgroundColor: KColor_White];
        [_nameLabel setFont:[UIFont systemFontOfSize:13*kMainScaleMiunes]];
        [_nameLabel setTextColor:KColor_Gray_99];
    }
    return _nameLabel;
}


-(UIImageView *)iconIamgeView{
    if (!_iconIamgeView) {
        _iconIamgeView = [[UIImageView alloc] init];
        [_iconIamgeView setBackgroundColor:KColor_Gray];
        [_iconIamgeView.layer setCornerRadius:15*kMainScaleMiunes];
        [_iconIamgeView.layer setMasksToBounds:YES];
    }
    return _iconIamgeView;
}

-(UILabel *)timeLabel {
    if (!_timeLabel) {
        
        _timeLabel = [[UILabel alloc] init];
        [_timeLabel setBackgroundColor:KColor_White];
        [_timeLabel setFont:[UIFont systemFontOfSize:10*kMainScaleMiunes]];
        [_timeLabel setTextAlignment:(NSTextAlignmentRight)];
        [_timeLabel setTextColor:KColor_Gray_99];
        
    }
    return _timeLabel;
}

-(UILabel *)contentLabel {
    if (!_contentLabel) {
        
        _contentLabel = [[UILabel alloc] init];
        [_contentLabel setBackgroundColor:KColor_White];
        [_contentLabel setFont:[UIFont systemFontOfSize:15*kMainScaleMiunes]];
        [_contentLabel setTextColor:KColor_Black];
        [_contentLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [_contentLabel setNumberOfLines:0];
        
    }
    return _contentLabel;
}

- (UIButton *)commentBut{
    if (!_commentBut) {
        _commentBut = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_commentBut setTitle:@"评论" forState:(UIControlStateNormal)];
        [_commentBut.titleLabel setFont:[UIFont systemFontOfSize:9*kMainScaleMiunes]];
        [_commentBut setTitleColor:KColor_Gray_66 forState:(UIControlStateNormal)];
        [_commentBut setBackgroundColor:KColor_White];
        [_commentBut addTarget:self action:@selector(commentButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_commentBut.layer setBorderColor:KColor_Gray_99.CGColor];
        [_commentBut.layer setBorderWidth:1.f];
        [_commentBut.layer setCornerRadius:2.f];
        [_commentBut.layer setMasksToBounds:YES];
        
    }
    return _commentBut;
}


-(void)commentButtonAction:(UIButton *)sender{
    
    if (self.commentBlock) {
        self.commentBlock(self.commentmodel.name);
    }
    
}


- (void)setCommentmodel:(CommentMdeol *)commentmodel{
    _commentmodel = commentmodel;
    
    [_iconIamgeView setImage:[UIImage imageNamed:@"1.jpg"]];
    [_nameLabel setText:commentmodel.name];
    [_timeLabel setText:commentmodel.time];
    [_contentLabel setText:commentmodel.comment];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
