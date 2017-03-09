//
//  MainController.m
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import "MainController.h"
#import "MainView.h"
#import "FruitModel.h"
#import "SnakeModel.h"

@interface MainController () <RefreshViewDelegate>

@property (nonatomic, strong) MainView *mainView;
@property (nonatomic, strong) FruitModel *fruitModel;
@property (nonatomic, strong) SnakeModel *snakeModel;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView  = [[MainView alloc] initWithFrame:self.view.frame];
    self.view = self.mainView;
    
    self.fruitModel = [FruitModel sharedFruitModel];
    self.snakeModel = [SnakeModel sharedSnakeModel];
    
    self.mainView.refreshDelegate = self;
    
    [self firedTimer];
}

- (void) firedTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(refreshAction) userInfo:nil repeats:true];
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void) stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void) refreshAction {
    [self.snakeModel moveSnake];
    CGPoint fruitPoint = self.fruitModel.fruitCenter;
    BOOL isTouchFruit = [self.snakeModel didEatFruitWithFruitPoint:fruitPoint];
    while (isTouchFruit) {
        [self.fruitModel createNewFruit];
        [self.snakeModel growUpSnakeLength];
        fruitPoint = self.fruitModel.fruitCenter;
        isTouchFruit = [self.snakeModel didEatFruitWithFruitPoint:fruitPoint];
    }
    
    BOOL isSuicide = [self.snakeModel checkDidSuicide];
    if (isSuicide) {
        [self stopTimer];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"系統訊息" message:@"You dead" preferredStyle:UIAlertControllerStyleAlert];
        __weak typeof(self) weakSelf = self;
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"確定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:true completion:nil];
            [weakSelf.snakeModel rebornSnake];
            [weakSelf.fruitModel createNewFruit];
            [weakSelf firedTimer];
        }];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:true completion:nil];
    }
    [self.mainView setNeedsDisplay];
}

- (CGPoint) shouldRefreshFruitAtPoint {
    return self.fruitModel.fruitCenter;
}

- (NSArray*) shouldRefreshSnakeAtPointArray {
    return self.snakeModel.pointsArray;
}

- (void) didChangeDirectionWithSwipeDirection:(UISwipeGestureRecognizerDirection)direction {
    self.snakeModel.direction = direction;
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
