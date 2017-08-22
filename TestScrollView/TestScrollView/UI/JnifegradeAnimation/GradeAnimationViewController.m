//
//  GradeAnimationViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/22.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "GradeAnimationViewController.h"

@interface GradeAnimationViewController ()


@property (copy, nonatomic) UILabel     *gradeLabel;

@property (copy, nonatomic) UIButton    *gradeButton;

@end

@implementation GradeAnimationViewController

#pragma mark --- Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initView];
    
}


#pragma mark --- InitView

- (void)initView{
    
    [self.view addSubview:self.gradeButton];
    
    [self.gradeButton  mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        
    }];
    
    
}

#pragma mark --- lazy load

- (UILabel *)gradeLabel{
    if (!_gradeLabel) {
        _gradeLabel = [[UILabel alloc] init];
        [_gradeLabel setBackgroundColor:[UIColor darkGrayColor]];
        
        
        
        
    }
    return _gradeLabel;
}

- (UIButton *)gradeButton {
    if (!_gradeButton) {
        _gradeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_gradeButton setImage:[UIImage imageNamed:@""] forState:(UIControlStateNormal)];
        [_gradeButton setBackgroundColor:[UIColor darkGrayColor]];
        [_gradeButton addTarget:self action:@selector(gradeButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _gradeButton;
}



#pragma mark --- orther Action

- (void)gradeButtonAction{
    
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
