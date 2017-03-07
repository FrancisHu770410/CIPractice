//
//  MainView.m
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
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
    
    CGContextAddArc(currentContext, fruitPoint.x, fruitPoint.y, 5.0, 0, 2 * M_PI, false);
    CGContextDrawPath(currentContext, kCGPathFill);
}

- (void) refreshDrawSnakeWithPoints:(NSArray *)pointArray {
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(currentContext, 0, 0, 0, 1.0);
    CGContextSetLineWidth(currentContext, 10.0);
    for (int i = 0; i < pointArray.count; i++) {
        NSValue *snakeCenter = pointArray[i];
        CGPoint pointCenter = snakeCenter.CGPointValue;
        if (i == 0) {
            CGContextMoveToPoint(currentContext, pointCenter.x, pointCenter.y);
        } else {
            CGContextAddLineToPoint(currentContext, pointCenter.x, pointCenter.y);
        }
    }
    
    CGContextDrawPath(currentContext, kCGPathStroke);
}

@end
