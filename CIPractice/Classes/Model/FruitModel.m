//
//  FruitModel.m
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import "FruitModel.h"

@implementation FruitModel

+ (FruitModel*) sharedFruitModel {
    static FruitModel *fruitModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fruitModel = [[FruitModel alloc] init];
    });
    return fruitModel;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        [self createNewFruit];
    }
    return self;
}

- (void) createNewFruit {
    int widthInt = [UIScreen mainScreen].bounds.size.width - 10;
    int heightInt = [UIScreen mainScreen].bounds.size.height - 10;
    int fruitCenterX = (arc4random() % widthInt) + 10;
    int fruitCenterY = (arc4random() % heightInt) + 10;
    self.fruitCenter = CGPointMake(fruitCenterX, fruitCenterY);
}

@end
