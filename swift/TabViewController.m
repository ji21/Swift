//
//  HomeViewController.m
//  swift
//
//  Created by Jeffrey Ip on 30/11/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "TabViewController.h"
#import "HomeViewController.h"
#import "SettingsTableViewController.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    HomeViewController *home1VC = [[HomeViewController alloc] init];
    HomeViewController *home2VC = [[HomeViewController alloc] init];
    SettingsTableViewController *settingsVC = [[SettingsTableViewController alloc] init];
//    self.selectedViewController
    NSArray *viewControllers = [NSArray arrayWithObjects:homeVC, home1VC, home2VC, settingsVC, nil];
    [self setViewControllers:viewControllers animated:NO];
    self.selectedIndex = 3;
    
    self.bottomNavBar = [[MDCBottomNavigationBar alloc] init];
    [self.view addSubview:self.bottomNavBar];
    self.bottomNavBar.titleVisibility = MDCBottomNavigationBarTitleVisibilitySelected;
    self.bottomNavBar.alignment = MDCBottomNavigationBarAlignmentJustifiedAdjacentTitles;
    
    
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"Home"
                                                              image:[UIImage imageNamed:@"ic_home"]
                                                                tag:0];
    
    
    UITabBarItem *messagesItem = [[UITabBarItem alloc] initWithTitle:@"Messages"
                                                              image:[UIImage imageNamed:@"ic_email"]
                                                                tag:0];
    UITabBarItem *favoritesItem =
        [[UITabBarItem alloc] initWithTitle:@"Favorites"
                                      image:[UIImage imageNamed:@"ic_favorite"]
                                        tag:0];
    
    UITabBarItem *readerItem = [[UITabBarItem alloc] initWithTitle:@"Reader"
                                                             image:[UIImage imageNamed:@"ic_reader"]
                                                               tag:0];
    self.bottomNavBar.delegate = self;
    self.bottomNavBar.items = @[ homeItem, messagesItem, favoritesItem, readerItem];
    self.bottomNavBar.selectedItem = messagesItem;
    [self.bottomNavBar setTitleVisibility:MDCBottomNavigationBarTitleVisibilityAlways];
    [self.bottomNavBar setItemsHorizontalPadding:18.0];
    [self.bottomNavBar setTruncatesLongTitles:NO];
    [self.bottomNavBar setBarHeight:62.0];
    [self.bottomNavBar setItemsContentVerticalMargin:0.0];
//    [self.bottomNavBar addSubview:homeVC];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGSize size = [self.bottomNavBar sizeThatFits:self.view.bounds.size];
    CGRect bottomNavBarFrame = CGRectMake(0,
                                        CGRectGetHeight(self.view.bounds) - size.height,
                                        size.width,
                                        size.height);
    self.bottomNavBar.frame = bottomNavBarFrame;
    [self.tabBar setFrame:CGRectMake(0, 0, 50, 100)];
    [self.tabBar setBackgroundColor:[UIColor blueColor]];
}

- (void)bottomNavigationBar:(nonnull MDCBottomNavigationBar *)bottomNavigationBar
              didSelectItem:(nonnull UITabBarItem *)item {
    if (item.title==@"Home") {
        self.selectedIndex = 1;
    }
}
@end
