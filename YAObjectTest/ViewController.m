//
//  ViewController.m
//  YAObjectTest
//
//  Created by lanjiying on 2018/3/29.
//  Copyright © 2018年 lanjiying_Anna. All rights reserved.
//

#import "ViewController.h"
#import "BlockObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testBlock];
}
- (void)testBlock
{
    [[BlockObject alloc] init];
    [BlockObject testPramsBlock:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
