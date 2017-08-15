//
//  SecViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/5/9.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "SecViewController.h"
#import "FirViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"second";
    
    UIButton *mortyButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [mortyButton setTitle:@"morty" forState:(UIControlStateNormal)];
    mortyButton.backgroundColor = [UIColor redColor];
    [mortyButton addTarget:self action:@selector(mortyButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    mortyButton.frame = CGRectMake(100, 200, 100, 40);
    [self.view addSubview:mortyButton];
    
    UIButton *backBut = [UIButton buttonWithType:(UIButtonTypeSystem)];
    backBut.frame = CGRectMake(15, 15, 70, 30);
    [backBut setBackgroundColor:[UIColor blackColor] ];
    [backBut setTitle:@"back" forState:(UIControlStateNormal)];
    [backBut setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    [backBut addTarget:self action:@selector(backButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *leftbar = [[UIBarButtonItem alloc] initWithCustomView:backBut];
    self.navigationItem.leftBarButtonItem = leftbar;
    
}


-(void)backButtonAction:(UIButton *)sender{
    NSArray *ControllerArray = self.navigationController.viewControllers;
    int total = 5;
    if (ControllerArray.count > 7) {
//        UIViewController *conVC = ControllerArray[ControllerArray.count - 6];
//        if ([conVC isKindOfClass:[FirViewController class]]) {
//            FirViewController *firVC = (FirViewController *)ControllerArray[ControllerArray.count - 4];
//            [self.navigationController popToViewController:firVC animated:YES];
//        } else {
//            [self.navigationController popViewControllerAnimated:YES];;
//            
//        }
        
        for (int i = 0; i < ControllerArray.count; i++) {
            UIViewController *conVC = ControllerArray[i];
            if ([conVC isKindOfClass:[FirViewController class]]) {
                total = total <= i ? total : i;
            }
        }
        
        FirViewController *firVC = (FirViewController *)ControllerArray[total];
        [self.navigationController popToViewController:firVC animated:YES];
        
    } else {
        [self.navigationController popViewControllerAnimated:YES];;

    }
    
    NSArray *tempArray = @[@"nick",@"morty",@"nick",@"morty",@"morty",@"nick",@"morty"];
    
    int minIndex = 5;
    for (int i = 0; i < tempArray.count; i++) {
        if ([tempArray[i] isEqualToString:@"morty"]) {
            minIndex = minIndex <= i ? minIndex : i;
        }
    }
    
    NSLog(@"%@",tempArray[minIndex]);
    NSLog(@"%d",minIndex);
    
//    if (3 <= total) {
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    } else {
//        [self.navigationController popViewControllerAnimated:YES];;
//    }
}

-(void)mortyButtonAction:(UIButton *)sender{

    FirViewController *firstVC = [[FirViewController alloc] init];
    
    [self.navigationController pushViewController:firstVC animated:YES];
    
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
