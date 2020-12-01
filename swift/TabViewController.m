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
#import "SubscribeViewController.h"
#import "StoriesViewController.h"
#import "MessagesTableViewController.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    StoriesViewController *storiesVC = [[StoriesViewController alloc] init];
    SubscribeViewController *subVC = [[SubscribeViewController alloc] init];
    MessagesTableViewController *messagesVC = [[MessagesTableViewController alloc] init];
    SettingsTableViewController *settingsVC = [[SettingsTableViewController alloc] init];
//    self.selectedViewController
    
    NSArray *viewControllers = [NSArray arrayWithObjects:homeVC, storiesVC, subVC, messagesVC, settingsVC, nil];
    [self setViewControllers:viewControllers animated:NO];
    self.selectedIndex = 5;
    
    self.bottomNavBar = [[MDCBottomNavigationBar alloc] init];
    [self.view addSubview:self.bottomNavBar];
    self.bottomNavBar.titleVisibility = MDCBottomNavigationBarTitleVisibilitySelected;
    self.bottomNavBar.alignment = MDCBottomNavigationBarAlignmentJustifiedAdjacentTitles;
    
    
    self.homeItem = [[UITabBarItem alloc] initWithTitle:@"Home"
                                                              image:[UIImage imageNamed:@"ic_home"]
                                                                tag:0];
    
    self.storiesItem = [[UITabBarItem alloc] initWithTitle:@"My Stories"
                                                              image:[UIImage imageNamed:@"ic_email"]
                                                                tag:0];
    
    self.messagesItem = [[UITabBarItem alloc] initWithTitle:@"Messages"
                                                              image:[UIImage imageNamed:@"ic_email"]
                                                                tag:0];
    
    self.subItem =
        [[UITabBarItem alloc] initWithTitle:@"Subscriptions"
                                      image:[UIImage imageNamed:@"ic_favorite"]
                                        tag:0];
    
    
    self.settingsItem = [[UITabBarItem alloc] initWithTitle:@"Settings"
                                                             image:[UIImage imageNamed:@"ic_reader"]
                                                               tag:0];
    
    self.bottomNavBar.delegate = self;
    self.bottomNavBar.items = @[ self.homeItem, self.storiesItem, self.subItem, self.messagesItem, self.settingsItem];
    self.bottomNavBar.selectedItem = self.messagesItem;
    [self.bottomNavBar setTitleVisibility:MDCBottomNavigationBarTitleVisibilityAlways];
    [self.bottomNavBar setItemsHorizontalPadding:20.0];
    [self.bottomNavBar setTruncatesLongTitles:NO];
    [self.bottomNavBar setBarHeight:self.bottomNavBar.barHeight*1.05];
//    [self.bottomNavBar addSubview:homeVC];
    UIFont *helvFont = [UIFont fontWithName:@"HelveticaNeue" size:10.0];
    NSLog(@"%@", self.bottomNavBar.itemTitleFont);
    [self.bottomNavBar setItemTitleFont:helvFont];
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
    NSLog(@"%@", item.title);
    if (item.title==@"Home") {
        self.selectedIndex = 1;
    } else if (item.title==@"Subscriptions") {
        self.selectedIndex = 3;
    } else if (item.title==@"My Stories") {
        self.selectedIndex = 2;
    } else if (item.title == @"Settings") {
        self.selectedIndex = 5;
    } else if (item.title == @"Messages") {
        self.selectedIndex = 4;
    }
}
@end
