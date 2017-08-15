//
//  TestCommentListVC.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/8/3.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "TestCommentListVC.h"
#import "CommentListCell.h"
#import "CommentMdeol.h"
#import "NSString+StringSize.h"
#import "InputView.h"
#import "HCTextView.h"


#define COMMENTCELLID   @"COMMENTCELLID"

@interface TestCommentListVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)InputView      *inputView;

@property (nonatomic, strong)UITableView    *commentListTableView;

@property (nonatomic, strong)NSMutableArray *dataSource;

@property (nonatomic, strong)HCTextView     *commentView;

@end

@implementation TestCommentListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:KColor_White];
    
    [self initTestCommentView];
    [self loadCommentlistData];
}

#pragma mark --- initView

- (void)initTestCommentView{
    
    [self.view addSubview:self.commentListTableView];
    

    
    
    // 监听键盘弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillHide:)
     
                                                 name:UIKeyboardWillHideNotification
     
                                               object:nil];
    
    [self.view addSubview:self.commentView];
    
    [self.commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(@49);
    }];
    
    
}

#pragma mark --- getdata

- (void)loadCommentlistData{
    
    self.dataSource = [NSMutableArray arrayWithCapacity:120];
    
    for (int i = 0; i < 10; i++) {
        
        CommentMdeol *model = [[CommentMdeol alloc] init];
        model.name = [NSString stringWithFormat:@"我是%d号",i];
        model.comment = @"踏破白云千万重，仰天池上水溶溶。横空大气排山去，砥柱人间是此峰。";
        model.time = @"06月14日";
        [self.dataSource addObject:model];
        
    }
    
    [self.commentListTableView reloadData];
    
    
}

#pragma mark --- getter

- (HCTextView *)commentView{
    
    if (!_commentView) {
        
        _commentView = [[HCTextView alloc] init];
        
     }
    
    return _commentView;
}

- (UITableView *)commentListTableView{
    if (!_commentListTableView) {
        
        _commentListTableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight)) style:(UITableViewStylePlain)];
        [_commentListTableView setBackgroundColor:KColor_White];
        
        [_commentListTableView registerClass:[CommentListCell class] forCellReuseIdentifier:COMMENTCELLID];
        [_commentListTableView setDelegate:self];
        [_commentListTableView setDataSource:self];
        _commentListTableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
        
    }
    return _commentListTableView;
}


#pragma mark --- tableView dataSource And delagate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentListCell *cell = (CommentListCell *)[tableView dequeueReusableCellWithIdentifier:COMMENTCELLID forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[CommentListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:COMMENTCELLID];
    }
    
    
    
    cell.commentBlock = ^(NSString *index) {
        NSLog(@"%@",index);
        
    };
    
    cell.commentmodel = self.dataSource[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentMdeol *model = self.dataSource[indexPath.row];
    CGSize strSize = [model.comment jnife_stringSizeWithFont:[UIFont systemFontOfSize:15*kMainScaleMiunes] maxWidth:kMainWidth - 115*kMainScaleMiunes];
    
    return 65*kMainScaleMiunes + strSize.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
//    [self.commentView resignFirstResponder];
//    
//    [self.commentView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.bottom.right.equalTo(self.view);
//        make.height.equalTo(@(49*kMainScaleMiunes));
//    }];
}

#pragma mark ---  other


// 键盘弹出会调用
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    // 获取键盘frame
    CGRect endFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 获取键盘弹出时长
//    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    
    _commentView.frame = CGRectMake(0,kMainHeight - endFrame.size.height - 49*kMainScaleMiunes, kMainWidth, 49*kMainScaleMiunes);
    
//    // 约束动画
//    [UIView animateWithDuration:duration animations:^{
//        [self.view layoutIfNeeded];
//    }];
}

- (void)keyboardWillHide:(NSNotification *)note{
    
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];

    _commentView.frame = CGRectMake(0, kMainHeight - 49*kMainScaleMiunes, kMainWidth, 49*kMainScaleMiunes);
    
    // 约束动画
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
