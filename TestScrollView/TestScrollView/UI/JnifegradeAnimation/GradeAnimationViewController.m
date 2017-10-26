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

    //第一种GET
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobile.ximalaya.com/m/category_tag_list?category=entertainment&device=iPhone&type=album"]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //拿到响应头信息
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        
        //4.解析拿到的响应数据
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"%@ \n %@", dic, res.allHeaderFields);
        
    }];
    
    [dataTask resume];
    
    //POST
    NSURLSession *session_post = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login"];
    
    NSMutableURLRequest *request_post = [NSMutableURLRequest requestWithURL:url];
    
    request_post.HTTPMethod = @"POST";
    request_post.HTTPBody = [@"username=520it&pwd=520it&type=JSON" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *dataTask_post = [session_post dataTaskWithRequest:request_post completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //拿到响应头信息
        NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
        
        //解析拿到的响应数据
        NSLog(@"%@\n%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding],res.allHeaderFields);
        
    }];
    
    [dataTask_post resume];
    
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
    
    [self.gradeView setTitle:@""];
    
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
