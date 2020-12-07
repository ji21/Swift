//
//  SettingsTableViewController.h
//  swift
//
//  Created by Jeffrey Ip on 01/12/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaterialNavigationDrawer.h"
#import "MaterialAppBar.h"
#import "MaterialButtons.h"


NS_ASSUME_NONNULL_BEGIN

@interface ProfileTableViewController : UINavigationController

@property(nonatomic, strong)UIView *botView;
@property(nonatomic, strong)UIView *infoView;
@property(nonatomic, strong)MDCBottomDrawerViewController *drawer;
@property(nonatomic, strong)MDCAppBarNavigationController *navigationController;
@property(nonatomic, strong)MDCAppBarViewController *appBarViewController;

-(void) layoutbotView;
-(void) presentDrawer;
-(void) configureNav;
-(void) pushFavorites;

@end

NS_ASSUME_NONNULL_END
