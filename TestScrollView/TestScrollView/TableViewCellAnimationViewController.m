//
//  TableViewCellAnimationViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/6/23.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "TableViewCellAnimationViewController.h"
#import "AnimationCell.h"

#define AnimationCellID  @"AnimationCellID"

@interface TableViewCellAnimationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView         *tableView;

@end

@implementation TableViewCellAnimationViewController


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(self.view.frame) style:(UITableViewStylePlain)];
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[AnimationCell class] forCellReuseIdentifier:AnimationCellID];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.tableView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self testTime];

}


-(void)testTime{
    NSDate *now = [NSDate date];//根据当前系统的时区产生当前的时间，绝对时间，所以同为中午12点，不同的时区，这个时间是不同的。
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.timeZone = [NSTimeZone systemTimeZone];//系统所在时区
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *systemTimeZoneStr =  [df stringFromDate:now];
    df.timeZone = [NSTimeZone defaultTimeZone];//默认时区，貌似和上一个没什么区别
    NSString *defaultTimeZoneStr = [df stringFromDate:now];
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:8 * 3600];//直接指定时区
    NSString *plus8TZStr = [df stringFromDate:now];
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];//这就是GMT+0时区了
    NSString *gmtTZStr = [df stringFromDate: now];
    NSLog(@"Test Time\nSys:%@\nDefault:%@\n+8:%@\nGMT:%@",systemTimeZoneStr,defaultTimeZoneStr,plus8TZStr,gmtTZStr);
}

//是否为今天
- (BOOL)isTodayWithDate:(NSDate *)date
{
    //now: 2015-09-05 11:23:00
    //self 调用这个方法的对象本身
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear ;
    
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:date];
    
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

#pragma mark -- UITableView datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AnimationCell *cell = [tableView dequeueReusableCellWithIdentifier:AnimationCellID];
    if (!cell) {
        cell = [[AnimationCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:AnimationCellID];
    }
    [cell setBackgroundColor:[UIColor whiteColor]];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
    return 300;
}

#pragma mark -- UITableView delegate

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.contentView.alpha = 0.3;
    CGAffineTransform transformScale = CGAffineTransformMakeScale(0.75,0.75); //缩放
    CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0.5, 0.6);//改变位置
    
    cell.contentView.transform = CGAffineTransformConcat(transformScale, transformTranslate);
    [tableView bringSubviewToFront:cell.contentView];
    [UIView animateWithDuration:.8f
                          delay:0.05
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         
                         cell.contentView.alpha = 1;
                         
                         //清空 transform
                         
                         cell.contentView.transform = CGAffineTransformIdentity;
                     } completion:nil];

    NSLog(@"%ld",indexPath.row);
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
