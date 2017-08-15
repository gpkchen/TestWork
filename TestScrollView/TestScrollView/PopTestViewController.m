//
//  PopTestViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/5/18.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "PopTestViewController.h"
#import "pop.h"

@interface PopTestViewController ()

@property(nonatomic, strong)UIButton    *pop_Basic;

@property(nonatomic, strong)UIButton    *pop_Spring;

@property(nonatomic, strong)UIView      *pop_view;


@end

@implementation PopTestViewController


#pragma amrk -- getter

-(UIButton *)pop_Basic{
    if (!_pop_Basic) {
        _pop_Basic = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_pop_Basic setBackgroundColor:[UIColor blueColor]];
        [_pop_Basic setTitle:@"pop_basic" forState:(UIControlStateNormal)];
        [_pop_Basic setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [_pop_Basic addTarget:self action:@selector(popBasicButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_pop_Basic setFrame:(CGRectMake(20, 30, 100, 35))];
        
    }
    return _pop_Basic;
}


-(UIButton *)pop_Spring{
    if (!_pop_Spring) {
        _pop_Spring = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_pop_Spring setBackgroundColor:[UIColor blueColor]];
        [_pop_Spring setTitle:@"pop_Spring" forState:(UIControlStateNormal)];
        [_pop_Spring setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [_pop_Spring addTarget:self action:@selector(popSpringButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_pop_Spring setFrame:(CGRectMake(130, 30, 100, 35))];
        
        
    }
    return _pop_Spring;
}

-(UIView *)pop_view{
    if (!_pop_view) {
        _pop_view = [[UIView alloc] initWithFrame:(CGRectMake(20, 120, 60, 60))];
        _pop_view.center = self.view.center;
        
        _pop_view.backgroundColor = [UIColor redColor];
        
    }
    return _pop_view;
}


#pragma mark -- Controller
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.title = @"pop动画";
    [self initMainView];
}

#pragma mark -- initmainView
-(void)initMainView{
    
    [self.view addSubview:self.pop_Basic];
    [self.view addSubview:self.pop_view];
    [self.view addSubview:self.pop_Spring];
    
}


#pragma mark -- other Method

-(void)popBasicButtonAction:(UIButton *)sender{
    
    POPBasicAnimation *pop_ani = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    pop_ani.toValue = @(self.pop_view.center.x + 40);
    pop_ani.beginTime = CACurrentMediaTime();
    [self.pop_view pop_addAnimation:pop_ani forKey:kPOPLayerPosition];

}


-(void)popSpringButtonAction:(UIButton *)sender{
    
//    POPSpringAnimation *pop_ani = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    pop_ani.springBounciness = 9.f;
//    pop_ani.toValue = @(self.pop_view.center.x - 120);
//    pop_ani.beginTime = CACurrentMediaTime();
//    [self.pop_view pop_addAnimation:pop_ani forKey:kPOPLayerPositionX];
    
    UILabel *label = [[UILabel alloc] initWithFrame:(CGRectMake(120, 200, 90, 24))];
    label.backgroundColor = [UIColor yellowColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor  = [UIColor grayColor];
    [self.view addSubview:label];
    
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
           UILabel *label = (UILabel *)obj;
            label.text = [NSString stringWithFormat:@"%d:%d:%d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
            label.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:(arc4random_uniform(256))/255.0 blue:(arc4random_uniform(256))/255.0 alpha:1.0];
            self.view.backgroundColor = label.backgroundColor;
        };
        //        prop.threshold = 0.01f;
    }];
    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
    anBasic.property = prop;    //自定义属性
    anBasic.fromValue = @(3*60);   //从0开始
    anBasic.toValue = @(0);  //180秒
    anBasic.duration = 3*60;    //持续3分钟
    anBasic.beginTime = CACurrentMediaTime() + 1.0f;    //延迟1秒开始
    [label pop_addAnimation:anBasic forKey:@"countdown"];
    
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
