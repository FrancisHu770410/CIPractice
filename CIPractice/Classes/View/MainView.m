//
//  MainView.m
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import "MainView.h"

@interface MainView()

@end

@implementation MainView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UISwipeGestureRecognizer *swipeUpGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeAction:)];
        [swipeUpGesture setNumberOfTouchesRequired:1];
        [swipeUpGesture setDirection:UISwipeGestureRecognizerDirectionUp];
        [self addGestureRecognizer:swipeUpGesture];
        
        UISwipeGestureRecognizer *swipeDownGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeAction:)];
        [swipeDownGesture setNumberOfTouchesRequired:1];
        [swipeDownGesture setDirection:UISwipeGestureRecognizerDirectionDown];
        [self addGestureRecognizer:swipeDownGesture];
        
        UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeAction:)];
        [swipeRightGesture setNumberOfTouchesRequired:1];
        [swipeRightGesture setDirection:UISwipeGestureRecognizerDirectionRight];
        [self addGestureRecognizer:swipeRightGesture];
        
        UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeAction:)];
        [swipeLeftGesture setNumberOfTouchesRequired:1];
        [swipeLeftGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
        [self addGestureRecognizer:swipeLeftGesture];
    }
    return self;
}

- (void) didSwipeAction:(UISwipeGestureRecognizer*)gesture {
    [self.refreshDelegate didChangeDirectionWithSwipeDirection:gesture.direction];
}

- (void) drawRect:(CGRect)rect {
    CGPoint fruitCenter = [self.refreshDelegate shouldRefreshFruitAtPoint];
    NSArray *snakeCenterArray = [self.refreshDelegate shouldRefreshSnakeAtPointArray];
    [self refreshDrawFruitWithPoint:fruitCenter];
    [self refreshDrawSnakeWithPoints:snakeCenterArray];
}

- (void) refreshDrawFruitWithPoint:(CGPoint)fruitPoint {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(currentContext, 0, 0, 0, 1.0);
    
    CGContextAddArc(currentContext, fruitPoint.x, fruitPoint.y, 2.5, 0, 2 * M_PI, false);
    CGContextDrawPath(currentContext, kCGPathFill);
}

- (void) refreshDrawSnakeWithPoints:(NSArray *)pointArray {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(currentContext, 0, 0, 0, 1.0);
    CGContextSetLineWidth(currentContext, 10.0);
    for (int i = 0; i < pointArray.count; i++) {
        NSValue *snakeCenter = pointArray[i];
        CGPoint pointCenter = snakeCenter.CGPointValue;
        CGContextMoveToPoint(currentContext, pointCenter.x - 5, pointCenter.y);
        CGContextAddLineToPoint(currentContext, pointCenter.x + 5, pointCenter.y);
        CGContextDrawPath(currentContext, kCGPathStroke);
    }
    
}

@end
