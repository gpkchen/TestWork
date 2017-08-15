//
//  HeaderView.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/6/28.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "HeaderView.h"

#import "JnifeBannerFlowLayout.h"

#import "TestBannerCell.h"

@interface HeaderView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView      *collectionView;

@property (nonatomic, strong) UIScrollView          *scrollView;

@end

#define TestBannerCellID   @"TestBannerCellID"

@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setMainView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setMainView];
    }
    return self;
}

-(void)setMainView{
    
//    [self addSubview:self.collectionView];
    
}

#pragma mark - CollectionView delegate and datasource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TestBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TestBannerCellID forIndexPath:indexPath];
    
    cell.backgroundColor = KColor_Gray_99;
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld",indexPath.row);
    
}

#pragma mark - getter 

//-(UICollectionView *)collectionView{
//    if (!_collectionView) {
//        JnifeBannerFlowLayout *layout = [[JnifeBannerFlowLayout alloc] init];
//    
//        _collectionView = [[UICollectionView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, 300)) collectionViewLayout:layout];
//        
//        [_collectionView setBackgroundColor:KColor_Gray];
//        [_collectionView setDelegate:self];
//        [_collectionView setDataSource:self];
//        
//        [_collectionView registerClass:[TestBannerCell class] forCellWithReuseIdentifier:TestBannerCellID];
//        
//        
//    }
//    return _collectionView;
//}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [_scrollView setFrame:(CGRectMake(0, 0, kMainWidth, 300))];
        [_scrollView setBackgroundColor:KColor_Gray];
        
        [_scrollView setContentSize:(CGSizeMake(kMainWidth * 5 , 290))];
        
        
        
        
    }
    return _scrollView;
}

@end
