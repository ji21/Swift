//
//  ViewController.m
//  swift
//
//  Created by Jeffrey Ip on 15/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "ViewController.h"
#import "SwiftViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        SwiftViewController *swiftVC = [[SwiftViewController alloc] init];
        [self addChildViewController:swiftVC];
    }
    return self;
}


@end
