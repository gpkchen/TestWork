//
//  RootViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/6/30.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "RootViewController.h"

#import "TestBounceViewController.h"

#import "PopTestViewController.h"

#import "CellAnimationViewController.h"

#import "TestBarViewController.h"

#import "TestPageVC.h"

#import "TableViewCellAnimationViewController.h"

#import "TestBannerViewController.h"

#import "TestCommentListVC.h"

#import "CardViewController.h"


@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation RootViewController


#pragma mark -- getter

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:120];
    }
    return _dataArray;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight)) style:(UITableViewStylePlain)];
        [_tableView setBackgroundColor:KColor_Gray];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
        
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
        
    }
    
    return _tableView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:KColor_White];
    
    [self.view addSubview:self.tableView];
    
    [self.dataArray addObjectsFromArray:@[@"TestBounceViewController",
                                          @"PopTestViewController",
                                          @"CellAnimationViewController",
                                          @"TestBarViewController",
                                          @"TestPageVC",
                                @"TableViewCellAnimationViewController",
                                          @"TestCommentListVC",
                                          @"CardViewController"]];
    
    
}


#pragma mark - tableView delegate and datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell.textLabel setText:self.dataArray[indexPath.row]];

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            TestBounceViewController *bounceVC = [[TestBounceViewController alloc] init];
            [self.navigationController pushViewController:bounceVC animated:YES];
        }
            break;
            
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
        {
            TestCommentListVC *commentVC = [[TestCommentListVC alloc] init];
            [self.navigationController pushViewController:commentVC animated:YES];
        }
            break;
        case 7:
        {
            CardViewController *cardVC = [[CardViewController alloc] init];
            [self.navigationController pushViewController:cardVC animated:YES];
        }
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
