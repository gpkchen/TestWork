//
//  CardViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/14.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "CardViewController.h"

#import "RevealViewController.h"

#import "ZCScreenShot.h"

@interface CardViewController ()

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *screenView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    
    [self.view addSubview:screenView];
    [screenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextViewController)];
    [self.view addGestureRecognizer:tapGes];
    
    [self.view setBackgroundColor:KColor_Gray_66];
    
}

- (void)nextViewController{
    
    UIImage *screenImage = [ZCScreenShot beginImageContext:self.view.frame View:self.view];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UIImage *leftImage = [ZCScreenShot beginImageContext:(CGRectMake(0, 0, kMainWidth/2, kMainHeight)) View:window];
    UIImage *rightImage = [ZCScreenShot beginImageContext:(CGRectMake(kMainWidth/2, 0, kMainWidth/2, kMainHeight)) View:window];
    
    
    RevealViewController *revealVC = [[RevealViewController alloc] init];
    
    revealVC.screenImage = screenImage;
    
    revealVC.leftImage = leftImage;
    
    revealVC.rightImage = rightImage;
    
    [self.navigationController pushViewController:revealVC animated:NO];
    
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
