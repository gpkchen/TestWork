//
//  RevealViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/14.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "RevealViewController.h"

@interface RevealViewController ()

@property (nonatomic, strong) UIImageView       *leftImageView;
@property (nonatomic, strong) UIImageView       *rightImageView;


@end

@implementation RevealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:KColor_Gray];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    _leftImageView = [[UIImageView alloc] initWithImage:self.leftImage];
    _leftImageView.frame = CGRectMake(0, 0, kMainWidth/2, kMainHeight);
    [window addSubview:_leftImageView];
    
    
    _rightImageView = [[UIImageView alloc] initWithImage:self.rightImage];
    _rightImageView.frame = CGRectMake(kMainWidth/2, 0, kMainWidth/2, kMainHeight);
    [window addSubview:_rightImageView];
    
    
    [UIView animateWithDuration:1.4f delay:.5f options:(UIViewAnimationOptionCurveEaseIn) animations:^{
        
        _leftImageView.frame = CGRectMake(-kMainWidth, 0, kMainWidth/2, kMainHeight);
        
        _rightImageView.frame = CGRectMake(kMainWidth / 2 * 3, 0, kMainWidth/2, kMainHeight);
        
    } completion:^(BOOL finished) {
        [_leftImageView removeFromSuperview];
        
        [_rightImageView removeFromSuperview];
        
        _leftImageView = nil;
        
        _rightImageView = nil;
    }];
    
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
