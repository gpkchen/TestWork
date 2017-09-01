//
//  ShadowViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/29.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "ShadowViewController.h"

@interface ShadowViewController ()

@property (nonatomic, strong) UIImageView   *shadowImageView;


@end

@implementation ShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.shadowImageView = [[UIImageView alloc] init];
    self.shadowImageView.backgroundColor = KColor_Gray;
    [self.view addSubview:self.shadowImageView];
    [self.shadowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view).offset(15*kMainScale);
        make.right.equalTo(self.view).offset(-15*kMainScale);
        make.height.equalTo(@(100));
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
