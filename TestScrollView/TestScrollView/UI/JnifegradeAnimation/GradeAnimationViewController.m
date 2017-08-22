//
//  GradeAnimationViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/22.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "GradeAnimationViewController.h"
#import "JnifeGradeView.h"

@interface GradeAnimationViewController ()

{
    CGFloat defaultW;
    CGFloat defaultH;
    CGFloat defaultR;
    CGFloat scale;
    UIView *bgView;
}

@property (copy, nonatomic) UILabel     *gradeLabel;

@property (copy, nonatomic) UIButton    *gradeButton;


@property (copy, nonatomic) JnifeGradeView  *gradeView;

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
    
    [self.view addSubview:self.gradeView];
    
    [self.gradeView  mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(130, 30));
        
    }];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setText];
}


#pragma mark --- lazy load

- (void)setText {
    
    [self.gradeView setTitle:@"10000"];
    
}

- (JnifeGradeView *)gradeView {
    if (!_gradeView) {
        _gradeView = [[JnifeGradeView alloc] init];
        
    }
    return _gradeView;
}


#pragma mark --- orther Action



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
