//
//  CellAnimationViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/5/27.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "CellAnimationViewController.h"
#import "CellAnimaitonCell.h"

@interface CellAnimationViewController ()

@end

@implementation CellAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.view.backgroundColor = [UIColor whiteColor];
    self.clearsSelectionOnViewWillAppear = NO;
    
    [self.tableView registerClass:[CellAnimaitonCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CellAnimaitonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    if (!cell) {
        cell = [[CellAnimaitonCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"reuseIdentifier"];
    }
    
    NSLog(@"%s",__FUNCTION__);
    
    NSMutableArray *cellArray = [NSMutableArray arrayWithArray: [tableView visibleCells]];
    
//    NSArray *cellArray =  [self.tableView indexPathsForRowsInRect:(CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 300))];
    NSLog(@"%@",cellArray);
//
//    if ([cellArray containsObject:cell]) {
//        cell.backImageView.frame = CGRectMake(0, 0, cell.backImageView.frame.size.width * 0.8, cell.frame.size.height * 0.8);
//        
//        [UIView animateWithDuration:1.0 animations:^{
//            cell.backImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , 180);
//        }];
//    }
    
    for (CellAnimaitonCell *tempCell in cellArray) {
        if (tempCell.frame.origin.y > 500) {
            cell.backImageView.frame = CGRectMake(0, 0, cell.backImageView.frame.size.width * 0.8, cell.frame.size.height * 0.8);
            
            [UIView animateWithDuration:0.5 animations:^{
                cell.backImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , 180);
            }];
        }
        
    }

    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);

}





-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
