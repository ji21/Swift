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

-(void) tapped;

@end

NS_ASSUME_NONNULL_END
