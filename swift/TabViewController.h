//
//  HomeViewController.h
//  swift
//
//  Created by Jeffrey Ip on 30/11/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaterialBottomNavigation.h"

NS_ASSUME_NONNULL_BEGIN

@interface TabViewController : UITabBarController

@property (nonatomic, strong) MDCBottomNavigationBar *bottomNavBar;

@property (nonatomic, strong) UITabBarItem *homeItem;
@property (nonatomic, strong) UITabBarItem *storiesItem;
@property (nonatomic, strong) UITabBarItem *messagesItem;
@property (nonatomic, strong) UITabBarItem *subItem;
@property (nonatomic, strong) UITabBarItem *profileItem;
@property (nonatomic, strong) UIView *topBorder;

-(void) tapped;
-(void) layoutSubViews;

@end

NS_ASSUME_NONNULL_END
