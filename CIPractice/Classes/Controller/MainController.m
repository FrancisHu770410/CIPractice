//
//  MainController.m
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import "MainController.h"
#import "MainView.h"

@interface MainController () <RefreshViewDelegate>

@property (nonatomic, strong) MainView *mainView;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView  = [[MainView alloc] initWithFrame:self.view.frame];
    self.view = self.mainView;
    
    self.mainView.refreshDelegate = self;
    [self.mainView setNeedsDisplay];
}

- (CGPoint) shouldRefreshFruitAtPoint {
    CGPoint testPoint = CGPointMake(150, 50);
    return testPoint;
}

- (NSArray*) shouldRefreshSnakeAtPointArray {
    NSValue *testValue = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *test2Value = [NSValue valueWithCGPoint:CGPointMake(200, 110)];
    return @[testValue, test2Value];
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
