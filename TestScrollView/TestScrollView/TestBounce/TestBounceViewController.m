//
//  TestBounceViewController.m
//  TestScrollView
//
//  Created by Tesla_Chen on 2017/6/30.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "TestBounceViewController.h"

@interface TestBounceViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, CAAnimationDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIImageView   *bgImageView;

@property(nonatomic,strong)CAShapeLayer * verticalLineLayer;

@property(nonatomic,strong)UIPanGestureRecognizer *sgr;


@end

@implementation TestBounceViewController


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, kMainHeight)) style:(UITableViewStylePlain)];
        [_tableView setBackgroundColor:KColor_Gray];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
        
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
        
        _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
        _bgImageView.frame = CGRectMake(0, 0, kMainWidth, 300);
        _tableView.tableHeaderView = _bgImageView;
        
        
    }
    
    return _tableView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:KColor_White];
    
    [self.view addSubview:self.tableView];
    
    [self createLine];
    
    [self addPanGesture];

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    [cell.textLabel setText:@"text"];
    
    return cell;
}

#pragma mark  -- scrollView delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _tableView) {
        if (scrollView.contentOffset.y < 0) {
            
            CGFloat amountY = scrollView.contentOffset.y + 64.0;
            
//            _tableView.bounces = NO;
            
            self.verticalLineLayer.path = [self getbottomLinePathWithAmout:-amountY];
            
//            _tableView.scrollEnabled = NO;
        } else {
            
            _tableView.bounces = YES;
            
        }
        NSLog(@"%.2f",scrollView.contentOffset.y);
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == _tableView) {
        if (scrollView.contentOffset.y < 0) {
            
            CGFloat amountY = scrollView.contentOffset.y + 64.0;
            
            [self animateTopLineReturnFrom:amountY];

            
        }
    }
}

- (void) addPanGesture {
//    self.sgr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSlideTop:)];
//    [self.view addGestureRecognizer:self.sgr];
}

- (void) createLine {
    
    self.verticalLineLayer = [CAShapeLayer layer];
    self.verticalLineLayer.strokeColor = [[UIColor whiteColor] CGColor];
    self.verticalLineLayer.lineWidth = 1.0;
    self.verticalLineLayer.fillColor = KColor_Purple.CGColor;
    
    [self.bgImageView.layer addSublayer:self.verticalLineLayer];
    
}


- (void) handleSlideTop:(UIPanGestureRecognizer *)gr{
    CGFloat amountX = [gr translationInView:self.view].x;
    CGFloat amountY = [gr translationInView:self.view].y;
    
    if ( ABS(amountX)  >  ABS(amountY)) {
        

        return;
    }
    
    if (gr.state == UIGestureRecognizerStateChanged) {
        
        if (amountY >= 0) {
            
            self.verticalLineLayer.path = [self getbottomLinePathWithAmout:amountY];
            
            
        } else {
            
            
            
            
        }
        
    }
    
    if (gr.state == UIGestureRecognizerStateEnded || gr.state == UIGestureRecognizerStateCancelled || gr.state == UIGestureRecognizerStateFailed) {
        if (amountY >= 0) {
            [self.view removeGestureRecognizer:gr];
            [self animateTopLineReturnFrom:amountY];
        }else{
            //            [self removeGestureRecognizer:gr];
            //            [self animateRightLineReturnFrom:fabs(amountX)];
        }
    }
    
}


- (CGPathRef) getbottomLinePathWithAmout:(CGFloat) amount {
    
    UIBezierPath *verticalLine = [UIBezierPath bezierPath];
    CGPoint topPoint = CGPointMake(0, 300);
    CGPoint midControlPoint = CGPointMake(kMainWidth / 2, amount + 300);
    CGPoint bottomPoint = CGPointMake(kMainWidth, 300);
    
    [verticalLine moveToPoint:topPoint];
    [verticalLine addQuadCurveToPoint:bottomPoint controlPoint:midControlPoint];
    [verticalLine closePath];
    
    return [verticalLine CGPath];
    
}

- (void) animateTopLineReturnFrom:(CGFloat)positionY {
    // ----- ANIMATION WITH BOUNCE
    CAKeyframeAnimation *morph = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    morph.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    NSArray *values = @[
                        (id) [self getbottomLinePathWithAmout:positionY],
                        (id) [self getbottomLinePathWithAmout:(positionY * 0.9)],
                        (id) [self getbottomLinePathWithAmout:(positionY * 0.6)],
                        (id) [self getbottomLinePathWithAmout:(positionY * 0.4)],
                        (id) [self getbottomLinePathWithAmout:(positionY * 0.25)],
                        (id) [self getbottomLinePathWithAmout:(positionY * 0.15)],
                        (id) [self getbottomLinePathWithAmout:(positionY * 0.05)],
                        (id) [self getbottomLinePathWithAmout:0.0]
                        ];
    morph.values = values;
    morph.duration = .2;
    morph.removedOnCompletion = NO;
    morph.fillMode = kCAFillModeForwards;
    morph.delegate = self;
    [self.verticalLineLayer addAnimation:morph forKey:@"bounce_bottom"];
    
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if(anim == [self.verticalLineLayer animationForKey:@"bounce_bottom"]){
        
        self.verticalLineLayer.path = [self getbottomLinePathWithAmout:0.0];
        [self.verticalLineLayer removeAllAnimations];
        [self addPanGesture];
        
    }
    
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
