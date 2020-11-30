//
//  ViewController.m
//  swift
//
//  Created by Jeffrey Ip on 15/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "ViewController.h"
#import "AuthViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        AuthViewController *authVC = [[AuthViewController alloc] init];
        [self addChildViewController:authVC];
    }
    return self;
}


@end
