//
//  ViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/4/21.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "ViewController.h"
#import "FirViewController.h"



#define kWidth      [UIScreen mainScreen].bounds.size.width
#define Kheight     [UIScreen mainScreen].bounds.size.height

static NSString *cellID = @"cellID";


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property(nonatomic, strong)UITableView *topTableView;
@property(nonatomic, strong)UITableView *bottomTableView;




@end

@implementation ViewController

#pragma mark -- getter
-(UITableView *)topTableView{
    if (!_topTableView) {
        _topTableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kWidth,Kheight)) style:(UITableViewStylePlain)];
        _topTableView.backgroundColor = [UIColor grayColor];
        _topTableView.delegate = self;
        _topTableView.dataSource = self;
        [_topTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        _topTableView.separatorStyle  = UITableViewCellSeparatorStyleSingleLine;
        _topTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _topTableView;
}

-(UITableView *)bottomTableView{
    if (!_bottomTableView) {
        _bottomTableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kWidth,Kheight)) style:(UITableViewStylePlain)];
        _bottomTableView.backgroundColor = [UIColor redColor];
        _bottomTableView.delegate = self;
        _bottomTableView.dataSource = self;
        [_bottomTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];

    }
    return _bottomTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initMainView];
}

-(void)initMainView{
    [self.view addSubview:self.topTableView];
//    [self.view addSubview:self.bottomTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (tableView == _topTableView) {
        return 5;
//    } else {
//        return 20;
//    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
//    if (tableView == _topTableView) {
        cell.backgroundColor = [UIColor whiteColor];
//    } else {
//        cell.backgroundColor = [UIColor redColor];
//    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (tableView == _topTableView) {
        return 45;
//    } else {
//        return 50;
//    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%f",scrollView.contentOffset.y );
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (scrollView == _bottomTableView) {
//        
//        if (offsetY <= -50) {
//            [UIView animateWithDuration:1.f animations:^{
//                CGRect tempTop = _topTableView.frame;
//                tempTop = CGRectMake(0, 0, kWidth, Kheight);
//                _topTableView.frame = tempTop;
//                CGRect temp = _bottomTableView.frame;
//                temp = CGRectMake(0, Kheight, kWidth, Kheight);
//                _bottomTableView.frame = temp;
//            }];
//        }
//        
//        
//    } else {
//        
//        if (offsetY >= 50) {
//            [UIView animateWithDuration:1.f animations:^{
//                
//                CGRect tempTop = _topTableView.frame;
//                tempTop = CGRectMake(0, -Kheight, kWidth, Kheight);
//                _topTableView.frame = tempTop;
//                CGRect temp = _bottomTableView.frame;
//                temp = CGRectMake(0, 0, kWidth, Kheight);
//                _bottomTableView.frame = temp;
//            }];
//        }
//        
//    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    FirViewController *firstVC = [[FirViewController alloc] init];
//    [self.navigationController pushViewController:firstVC animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
