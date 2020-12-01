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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor = [[UIColor alloc]initWithRed: 217.0/255.0 green:65.0/255.0 blue:100.0/255.0 alpha:1.0];
    self.tableView.separatorColor = [UIColor clearColor];
    
    self.botView = [[UIView alloc] init];
    [self.view addSubview:self.botView];
//    [self.botView setBackgroundColor:[[UIColor alloc]initWithRed: 217.0/255.0 green:65.0/255.0 blue:100.0/255.0 alpha:1.0]];
    [self.botView setBackgroundColor:[UIColor blueColor]];
    [self.botView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height*0.1, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*1.5)];
    self.infoView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height*0.1, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.infoView setBackgroundColor:[UIColor whiteColor]];
    [self.infoView.layer setCornerRadius:[UIScreen mainScreen].bounds.size.height*0.05];
    [self.botView addSubview:self.infoView];
    [self layoutbotView];
//    self.botView.layer.cornerRadius = self.botView.bounds.size.width*0.1;
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
