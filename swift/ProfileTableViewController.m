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


    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-30, 0, 30, 30)];
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"ek" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(presentDrawer) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationBar addSubview:btn];
    
    self.drawer = [[MDCBottomDrawerViewController alloc] init];
    

    self.drawer.contentViewController =[UIViewController new];
    self.drawer.contentViewController.view.backgroundColor = [UIColor whiteColor];
    self.drawer.contentViewController.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*0.4);
//    [self.drawer setPreferredContentSize:CGSizeMake(100, 100)];
    self.drawer.headerViewController = [UIViewController new];
    self.drawer.headerViewController.view.backgroundColor = [UIColor blackColor];
    self.drawer.headerViewController.title = @"weiugryew";
    UIView  *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,100,100)];
    headerView.backgroundColor = [UIColor blackColor];
    [headerView setHidden:NO];
//    [self.drawer.headerViewController setView:headerView];
    [self.drawer.headerViewController.view addSubview:headerView];
    NSLog(self.drawer.headerViewController.beingPresented? @"ok" : @"not ok");
    [self configureNav];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    

}

-(void) presentDrawer {
    [self presentViewController:self.drawer animated:YES completion:nil];
}

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe{

    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self presentViewController:self.drawer animated:YES completion:nil];
    }
}

-(void) configureNav {
    MDCButton *favBtn = [[MDCButton alloc] init];
    [favBtn setBackgroundColor:[UIColor clearColor] forState:UIControlStateNormal];
    [favBtn setBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:0.5] forState:UIControlEventTouchDown];
    [favBtn setTitle:@"Favorites" forState:UIControlStateNormal];
    favBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [favBtn setTintColor:[UIColor blackColor]];
    [favBtn setEnableRippleBehavior:NO];
//    [favBtn setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.5] forState:UIControlStateHighlighted];
    
    [favBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [favBtn addTarget:self action:@selector(pushFavorites) forControlEvents:UIControlEventTouchUpInside];
    favBtn.uppercaseTitle = NO;
    [self.drawer setShouldIncludeSafeAreaInContentHeight:NO];
    [self.drawer.contentViewController.view addSubview:favBtn];
//    [self.drawer.view bringSubviewToFront:favBtn];

    [self.drawer.contentViewController.view configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.justifyContent = YGJustifyFlexStart;
    }];
    
    [favBtn configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPercentValue(100);
        layout.height = YGPercentValue(7);
        layout.maxHeight = YGPointValue(100);
    }];
    
    [self.drawer.contentViewController.view.yoga applyLayoutPreservingOrigin:YES];
}

-(void) pushFavorites {
    NSLog(@"ok");
    [self.drawer dismissViewControllerAnimated:YES completion:nil];
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
