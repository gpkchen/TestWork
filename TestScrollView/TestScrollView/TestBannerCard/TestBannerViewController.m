//
//  TestBannerViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/6/28.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "TestBannerViewController.h"

#import "HeaderView.h"

@interface TestBannerViewController ()

@end

@implementation TestBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:KColor_White];
    
    HeaderView *headerView = [[HeaderView alloc] init];
    [headerView setBackgroundColor:KColor_Gray];
    [headerView setFrame:(CGRectMake(0, 0, kMainWidth, 300))];
    [self.view addSubview:headerView];
    
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
