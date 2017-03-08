//
//  SnakeModel.h
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SnakeModel : NSObject

@property (nonatomic, strong) NSMutableArray *pointsArray;
@property (nonatomic, assign) UISwipeGestureRecognizerDirection direction;

+ (SnakeModel*) sharedSnakeModel;

- (void) moveSnake;
- (void) growUpSnakeLength;
- (BOOL) checkDidSuicide;
- (BOOL) didEatFruitWithFruitPoint:(CGPoint)fruitPoint;

@end
