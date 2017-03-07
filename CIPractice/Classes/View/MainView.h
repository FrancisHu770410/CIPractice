//
//  MainView.h
//  CIPractice
//
//  Created by 胡珀菖 on 2017/3/7.
//  Copyright © 2017年 胡珀菖. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RefreshViewDelegate <NSObject>

@required
- (CGPoint) shouldRefreshFruitAtPoint;
- (NSArray*) shouldRefreshSnakeAtPointArray;
- (void) didChangeDirectionWithSwipeDirection:(UISwipeGestureRecognizerDirection)direction;

@end

@interface MainView : UIView

@property (nonatomic, weak) id <RefreshViewDelegate> refreshDelegate;

@end
