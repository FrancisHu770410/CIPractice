//
//  MainView.h
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView

- (void) refreshDrawFruitWithPoint:(CGPoint)fruitPoint;
- (void) refreshDrawSnakeWithPoints:(NSArray*)pointArray;

@end
