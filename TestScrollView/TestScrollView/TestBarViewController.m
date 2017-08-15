//
//  TestBarViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/6/6.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "TestBarViewController.h"
#import <objc/runtime.h>

@interface TestBarViewController ()

//@property (nonatomic, strong) NSString      *test_objc;

@end

@implementation TestBarViewController


static  NSString      *test_objckey;
static  UITableView      *tableViewkey;


-(NSString *)test_objc{
    return  objc_getAssociatedObject(self, &test_objckey);
}

-(void)setTest_objc:(NSString *)test_objc{
    objc_setAssociatedObject(self, &test_objckey, test_objc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.test_objc = @"test_objc";

    NSLog(@"%@,%s",self.test_objc,__FUNCTION__);

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    [self.navigationController.navigationBar setBarStyle:(UIBarStyleBlackTranslucent)];
//
//    self.automaticallyAdjustsScrollViewInsets = NO;
////
//    UIImage *img = [[UIImage alloc] init];
//    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:(UIBarMetricsDefault)];

//    [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
//    
//    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    self.test_objc = @"test_";

    NSLog(@"%@,%s",self.test_objc,__FUNCTION__);
    
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
