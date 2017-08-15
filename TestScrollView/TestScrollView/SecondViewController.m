//
//  SecondViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/5/9.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"second";
    
    UIButton *mortyButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [mortyButton setTitle:@"morty" forState:(UIControlStateNormal)];
    mortyButton.backgroundColor = [UIColor redColor];
    [mortyButton addTarget:self action:@selector(mortyButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    mortyButton.frame = CGRectMake(100, 200, 100, 40);
    [self.view addSubview:mortyButton];
    
    
}


-(void)mortyButtonAction:(UIButton *)sender{
    
    NSArray *ControllerArray = self.navigationController.viewControllers;
    for (UIViewController *conVC in ControllerArray) {
        if ([conVC isKindOfClass:[UIViewController class]]) {
            [self.navigationController pushViewController:conVC animated:YES];
        } else {
            FirstViewController *firstVC = [[FirstViewController alloc] init];
            [self.navigationController pushViewController:firstVC animated:YES];
        }
    }
    
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
