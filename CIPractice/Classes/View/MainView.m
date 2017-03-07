//
//  MainView.m
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (void) drawRect:(CGRect)rect {
//    [self refreshDrawFruitWithPoint:CGPointMake(0, 0)];
}

- (void) refreshDrawFruitWithPoint:(CGPoint)fruitPoint {
    UIView *fruitView = [[UIView alloc] initWithFrame:CGRectMake(fruitPoint.x - 1.0, fruitPoint.y - 1.0, 2.0, 2.0)];
    fruitView.backgroundColor = [UIColor blackColor];
    [self addSubview:fruitView];
}

- (void) refreshDrawSnakeWithPoints:(NSArray *)pointArray {
    
}

@end
