//
//  SnakeModel.m
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import "SnakeModel.h"

@implementation SnakeModel

+ (SnakeModel*) sharedSnakeModel {
    static SnakeModel *snakeModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        snakeModel = [[SnakeModel alloc] init];
    });
    return snakeModel;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        NSValue *value = [NSValue valueWithCGPoint:CGPointMake(150.0, 150.0)];
        NSValue *secondValue = [NSValue valueWithCGPoint:CGPointMake(160.0, 150.0)];
        self.pointsArray = [NSMutableArray arrayWithArray:@[value, secondValue]];
        self.direction = UISwipeGestureRecognizerDirectionRight;
    }
    return self;
}

- (void) growUpSnakeLength {
    NSValue *pointValue = [self.pointsArray lastObject];
    double newX = pointValue.CGPointValue.x;
    double newY = pointValue.CGPointValue.y;
    switch (self.direction) {
        case UISwipeGestureRecognizerDirectionRight:
            newX -= 10;
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            newX += 10;
            break;
        case UISwipeGestureRecognizerDirectionUp:
            newY += 10;
            break;
        case UISwipeGestureRecognizerDirectionDown:
            newY -= 10;
            break;
        default:
            break;
    }
    NSValue *newPointValue = [NSValue valueWithCGPoint:CGPointMake(newX, newY)];
    [self.pointsArray addObject:newPointValue];

}

- (void) moveSnake {
    NSValue *pointValue = self.pointsArray[0];
    double newX = pointValue.CGPointValue.x;
    double newY = pointValue.CGPointValue.y;
    switch (self.direction) {
        case UISwipeGestureRecognizerDirectionRight:
            newX += 10;
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            newX -= 10;
            break;
        case UISwipeGestureRecognizerDirectionUp:
            newY -= 10;
            break;
        case UISwipeGestureRecognizerDirectionDown:
            newY += 10;
            break;
        default:
            break;
    }
    NSValue *newPointValue = [NSValue valueWithCGPoint:CGPointMake(newX, newY)];
    [self.pointsArray insertObject:newPointValue atIndex:0];
    [self.pointsArray removeLastObject];
}

- (BOOL) checkDidSuicide {
    return false;
}

@end
