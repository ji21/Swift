//
//  SettingsTableViewController.h
//  swift
//
//  Created by Jeffrey Ip on 01/12/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaterialNavigationDrawer.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileTableViewController : UITableViewController

@property(nonatomic, strong)UIView *botView;
@property(nonatomic, strong)UIView *infoView;
@property(nonatomic, strong)MDCBottomDrawerViewController *drawer;

-(void) layoutbotView;

@end

NS_ASSUME_NONNULL_END
