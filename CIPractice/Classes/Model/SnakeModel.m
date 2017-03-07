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

@end
