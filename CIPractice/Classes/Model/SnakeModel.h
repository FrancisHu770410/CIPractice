//
//  SnakeModel.h
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SnakeMoveDirection) {
    SnakeMoveDirectionUp = 0,
    SnakeMoveDirectionDown,
    SnakeMoveDirectionLeft,
    SnakeMoveDirectionRight,
};

@interface SnakeModel : NSObject

@property (nonatomic, strong) NSMutableArray *pointsArray;
@property (nonatomic, assign) SnakeMoveDirection direction;

- (void) moveSnake;
- (void) growUpSnakeLength;
- (BOOL) checkDidSuicide;

@end
