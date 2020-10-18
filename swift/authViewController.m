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

- (void) backAction {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIColor *color = [[UIColor alloc]initWithRed:23.0/255.0 green:54.0/255.0 blue:121.0/255.0 alpha:1.0];
    self.view.backgroundColor = color;
    [self.navigationController.navigationBar.topItem setTitle:@"Back"];

}

- (void)viewDidAppear:(BOOL)animated {
    [self.navigationController.navigationBar.backItem setTitle:@"Back"];
}

@end
