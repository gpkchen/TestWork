//
//  TestPageVC.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/6/12.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "TestPageVC.h"

#import "pop.h"

#import "TypeWriterLabel.h"

#import "RQShineLabel.h"

@interface TestPageVC ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView       *scrollView;



@property (nonatomic, strong)UIImageView    *fir_iV;
@property (nonatomic, strong)UIImageView    *sec_iV;
@property (nonatomic, strong)UIImageView    *thr_iV;

@property (nonatomic, strong)TypeWriterLabel        *textLabel;
@property (strong, nonatomic) RQShineLabel          *floatLabel;

@end

@implementation TestPageVC

-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight))];
        _scrollView.backgroundColor = KColor_Gray;
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(kMainWidth * 3, kMainHeight);
        _scrollView.pagingEnabled = YES;
        _scrollView.directionalLockEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        
        for (int i = 0; i < 3; i++) {
           UIScrollView *scrView = [[UIScrollView alloc] initWithFrame:CGRectMake(i*kMainWidth, 0, kMainWidth, kMainHeight)];
            
            scrView.contentSize = self.scrollView.frame.size;
            scrView.scrollEnabled = NO;
            scrView.delegate = self;
            [self.scrollView addSubview:scrView];

            if (i == 0) {
                _fir_iV = [[UIImageView alloc ] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight))];
                [_fir_iV setBackgroundColor:KColor_White];
                [_fir_iV setImage:[UIImage imageNamed:@"1.jpg"]];
                [scrView addSubview:_fir_iV];
            } else if(i == 1) {
                _sec_iV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight))];
                [_sec_iV setImage:[UIImage imageNamed:@"2.jpg"]];
                [scrView addSubview:_sec_iV];
            } else {
                _thr_iV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight))];
                [_thr_iV setImage:[UIImage imageNamed:@"3.jpg"]];
                [scrView addSubview:_thr_iV];
            }
            
        }
        
      
    }
    return _scrollView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat content = scrollView.contentOffset.x;
    
    if (content >= 0 && content <= scrollView.contentSize.width - [UIScreen mainScreen].bounds.size.width) {
        
        //rect.size.width = [UIScreen mainScreen].bounds.size.width - content / 2;
        
        if (0 < content && content < kMainWidth) {
            
            CGRect contentImageViewRect = _fir_iV.frame;
            CGRect nextImageViewRect = _sec_iV.frame;
            contentImageViewRect.origin.x = 0 + (content - 0 * kMainWidth) ;
            nextImageViewRect.origin.x = 0 - [UIScreen mainScreen].bounds.size.width  + (content - 0 * kMainWidth) ;
            
            _fir_iV.frame = contentImageViewRect;
            _sec_iV.frame = nextImageViewRect;
            
        } else if(kMainWidth < content && content < 2*kMainWidth) {
            
            CGRect contentImageViewRect = _sec_iV.frame;
            CGRect nextImageViewRect = _thr_iV.frame;
            contentImageViewRect.origin.x = 0 + (content - 1 * kMainWidth) ;
            nextImageViewRect.origin.x = 0 - [UIScreen mainScreen].bounds.size.width  + (content - 1 * kMainWidth) ;
            
            _sec_iV.frame = contentImageViewRect;
            _thr_iV.frame = nextImageViewRect;
            

        }
        

    }
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    CGFloat content = scrollView.contentOffset.x;
    
    if (content >= 0 && content <= scrollView.contentSize.width - [UIScreen mainScreen].bounds.size.width) {
        
        [_fir_iV.layer removeAllAnimations];
        _fir_iV.frame = CGRectMake(0, 0, kMainWidth, kMainHeight);
        [_sec_iV.layer removeAllAnimations];
        _sec_iV.frame = CGRectMake(0, 0, kMainWidth, kMainHeight);
        [_thr_iV.layer removeAllAnimations];
        _thr_iV.frame = CGRectMake(0, 0, kMainWidth, kMainHeight);
        
        
    }
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat content = scrollView.contentOffset.x;
    
    if (content >= 0 && content <= scrollView.contentSize.width - [UIScreen mainScreen].bounds.size.width) {
        
        if ( content == 0) {
            
            [UIView animateWithDuration:7 animations:^{
                CGRect rect = self.fir_iV.frame;
                _fir_iV.layer.frame = CGRectMake(rect.origin.x - 20, rect.origin.y - 20, rect.size.width + 40, rect.size.height + 40);
            }];
            
        } else if(content == kMainWidth) {
            
            [UIView animateWithDuration:5 animations:^{
                CGRect rect = self.sec_iV.frame;
                _sec_iV.layer.frame = CGRectMake(rect.origin.x - 20, rect.origin.y - 20, rect.size.width + 40, rect.size.height + 40);
            }];
        } else if (content == 2*kMainWidth) {
            [UIView animateWithDuration:5 animations:^{
                CGRect rect = self.thr_iV.frame;
                _thr_iV.layer.frame = CGRectMake(rect.origin.x - 20, rect.origin.y - 20, rect.size.width + 40, rect.size.height + 40);
            }];
        }

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:KColor_Clear];
    [self.view addSubview:self.scrollView];
    
    _textLabel = [[TypeWriterLabel alloc] initWithFrame:(CGRectMake(20, kMainHeight - 150, kMainWidth - 40, 100))];
    [_textLabel setNumberOfLines:0];
    [_textLabel setBackgroundColor:KColor_Clear];
    [_textLabel setTextColor:KColor_Clear];
    _textLabel.typewriteEffectColor = KColor_Yellow;
    _textLabel.typewriteTimeInterval = 0.06f;
    [self.view addSubview:_textLabel];
    
    UIButton *changeBut = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [changeBut setBackgroundColor:KColor_Black_Main ];
    [changeBut setTitle:@"打字机效果" forState:(UIControlStateNormal)];
    [changeBut setTitleColor:KColor_Yellow forState:(UIControlStateNormal)];
    [changeBut addTarget:self action:@selector(changButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:changeBut];
    [changeBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view).offset(15*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(110, 20));
    }];
    
    _floatLabel = [[RQShineLabel alloc] initWithFrame:self.textLabel.frame];
    _floatLabel.backgroundColor = KColor_Clear;
    _floatLabel.textColor = KColor_Yellow;
    _floatLabel.numberOfLines = 0;
    [self.view addSubview:_floatLabel];
    
    
    UIButton *floatBut = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [floatBut setBackgroundColor:KColor_Black_Main ];
    [floatBut setTitle:@"浮动效果" forState:(UIControlStateNormal)];
    [floatBut setTitleColor:KColor_Yellow forState:(UIControlStateNormal)];
    [floatBut addTarget:self action:@selector(floatButAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:floatBut];
    [floatBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.right.equalTo(self.view).offset(-15*kMainScaleMiunes);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
}


-(void)changButtonAction:(UIButton *)sender{
    if (_textLabel) {
        if (_floatLabel) {
            _floatLabel.alpha = 0;
        }
        _textLabel.alpha = 1;
        _textLabel.text = @"Code4App帮助开发者收集高质量的开源代码，并允许用户分享自己编写的代码。Code4App 会为每份代码做严格的模拟机和真机测试，并为每份代码配上文字说明、屏幕截屏效果图以及视频演示（如果需要）。同时，Code4App 允许用户自行上传代码分享给其他用户。调动开发者用户积极性的同时，充分的发挥了开源分享的精神。";
        _textLabel.currentIndex = 0;
        [_textLabel startTypewrite];
        
    }
}

-(void)floatButAction:(UIButton *)sender{
    if (_textLabel) {
        _textLabel.alpha = 0;
    }
    _floatLabel.alpha = 1;
    
    _floatLabel.text = @"Code4App帮助开发者收集高质量的开源代码，并允许用户分享自己编写的代码。Code4App 会为每份代码做严格的模拟机和真机测试，并为每份代码配上文字说明、屏幕截屏效果图以及视频演示（如果需要）。同时，Code4App 允许用户自行上传代码分享给其他用户。调动开发者用户积极性的同时，充分的发挥了开源分享的精神。";
    
    [self.floatLabel shine];
    
   
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
