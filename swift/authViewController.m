//
//  authViewController.m
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "authViewController.h"

@interface authViewController ()

@end

@implementation authViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIColor *color = [[UIColor alloc]initWithRed:23.0/255.0 green:54.0/255.0 blue:121.0/255.0 alpha:1.0];
    self.view.backgroundColor = color;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
