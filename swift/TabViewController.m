//
//  HomeViewController.m
//  swift
//
//  Created by Jeffrey Ip on 30/11/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "TabViewController.h"
#import "HomeViewController.h"
#import "ProfileTableViewController.h"
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
    ProfileTableViewController *profileVC = [[ProfileTableViewController alloc] init];

    
    NSArray *viewControllers = [NSArray arrayWithObjects:homeVC, storiesVC, subVC, messagesVC, profileVC, nil];
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
    
    
    self.profileItem = [[UITabBarItem alloc] initWithTitle:@"Profile"
                                                             image:[UIImage imageNamed:@"ic_reader"]
                                                               tag:0];
    
    self.bottomNavBar.delegate = self;
    self.bottomNavBar.items = @[ self.homeItem, self.storiesItem, self.subItem, self.messagesItem, self.profileItem];

    self.bottomNavBar.selectedItem = self.messagesItem;
    [self.bottomNavBar setTitleVisibility:MDCBottomNavigationBarTitleVisibilityAlways];
    [self.bottomNavBar setItemsHorizontalPadding:4.0];
    [self.bottomNavBar setTruncatesLongTitles:NO];
    [self.bottomNavBar setEnableRippleBehavior:NO];

    [self.bottomNavBar setShadowColor:[UIColor clearColor]];
    self.topBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];

    self.topBorder.backgroundColor = [[UIColor alloc] initWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:0.7];
    [self.bottomNavBar addSubview:self.topBorder];
    [self.bottomNavBar setSelectedItemTintColor:[[UIColor alloc]initWithRed:242.0/255.0 green:70.0/255.0 blue:125.0/255.0 alpha:1.0]];
    
    UIFont *helvFont = [UIFont fontWithName:@"HelveticaNeue" size:10.0];
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
    
    self.bottomNavBar.translatesAutoresizingMaskIntoConstraints = NO;
    UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
    [self.bottomNavBar.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor].active = YES;
    [self.bottomNavBar.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor].active = YES;
    [self.bottomNavBar.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
    
    
    [self.view layoutIfNeeded];
    [self.bottomNavBar layoutIfNeeded];
    
    NSLog(@"%@", self.bottomNavBar.backgroundColor);

    [self.tabBar setFrame:CGRectMake(0, 0, 50, 100)];
    [self.tabBar setBackgroundColor:[UIColor clearColor]];
    [self.tabBar setTranslucent:NO];
    self.tabBar.barTintColor = [UIColor whiteColor];
}

- (void)bottomNavigationBar:(nonnull MDCBottomNavigationBar *)bottomNavigationBar
              didSelectItem:(nonnull UITabBarItem *)item {
    NSLog(@"%@", item.title);
    if (item.title==@"Home") {
        self.selectedIndex = 0;
    } else if (item.title==@"Subscriptions") {
        self.selectedIndex = 2;
    } else if (item.title==@"My Stories") {
        self.selectedIndex = 1;
    } else if (item.title == @"Profile") {
        self.selectedIndex = 4;
    } else if (item.title == @"Messages") {
        self.selectedIndex = 3;
    }
}
@end
