//
//  SettingsTableViewController.m
//  swift
//
//  Created by Jeffrey Ip on 01/12/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "ProfileTableViewController.h"
#import <YogaKit/UIView+Yoga.h>

@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc]initWithRed: 239.0/255.0 green:67.0/255.0 blue:128.0/255.0 alpha:1.0];
    [self.navigationBar setTranslucent:false];
    [self.navigationBar setValue:@(YES) forKeyPath:@"hidesShadow"];
    self.navigationBar.barTintColor = [[UIColor alloc]initWithRed: 239.0/255.0 green:67.0/255.0 blue:128.0/255.0 alpha:1.0];

    UITableViewController *tableView = [[UITableViewController alloc] init];
    tableView.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    tableView.view.backgroundColor = [[UIColor alloc]initWithRed: 239.0/255.0 green:67.0/255.0 blue:128.0/255.0 alpha:1.0];
    [self.view addSubview:tableView.view];
    [self.view bringSubviewToFront:self.navigationBar];
    tableView.tableView.separatorColor = [UIColor clearColor];
    self.botView = [[UIView alloc] init];
    [tableView.view addSubview:self.botView];
    [self.botView setBackgroundColor:[UIColor whiteColor]];
    [self.botView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height*0.2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*1.5)];
    [self.botView.layer setCornerRadius:[UIScreen mainScreen].bounds.size.height*0.05];
//    self.infoView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height*0.1, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//    [self.infoView setBackgroundColor:[UIColor whiteColor]];
//    [self.infoView.layer setCornerRadius:[UIScreen mainScreen].bounds.size.height*0.05];
//    [self.botView addSubview:self.infoView];
//    [self layoutbotView];



    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-30, 0, 30, 30)];
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"ek" forState:UIControlStateNormal];
    [self.navigationBar addSubview:btn];
    
    
//    self.navigationController = [[MDCAppBarNavigationController alloc] init];
//    self.appBarViewController = [[MDCAppBarViewController alloc] init];
//    self.appBarViewController.inferTopSafeAreaInsetFromViewController = YES;
//    self.appBarViewController.headerView.minMaxHeightIncludesSafeArea = NO;
//    self.navigationController.delegate = self;
//    [self.navigationController pushViewController:self animated:YES];
//    [self appBarNavigationController:self.navigationController willAddAppBarViewController:self.appBarViewController asChildOfViewController:self];
//
//    self.navigationItem.rightBarButtonItem = flipButton;
////

}

- (void)appBarNavigationController:(MDCAppBarNavigationController *)navigationController
       willAddAppBarViewController:(MDCAppBarViewController *)appBarViewController
           asChildOfViewController:(UIViewController *)viewController {
//    navigationController.translatesAutoresizingMaskIntoConstraints = NO
    
    
    appBarViewController.headerView.backgroundColor = [UIColor whiteColor];
    appBarViewController.headerView.minimumHeight = 80;

    [self.view layoutIfNeeded];
}

-(void) layoutbotView{
    [self.botView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
    }];
    
    

    [self.botView.yoga applyLayoutPreservingOrigin:YES];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
