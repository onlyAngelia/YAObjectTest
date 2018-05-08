//
//  ObjectAutoInforceBlock.m
//  YAObjectTest
//
//  Created by lanjiying on 2018/5/8.
//  Copyright © 2018年 lanjiying_Anna. All rights reserved.
//

#import "ObjectAutoInforceBlock.h"

@implementation ObjectAutoInforceBlock
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)testTheLastVarOfBlockImpl
{
    NSString *testString = @"Just for test";
    void (^block)(void)= ^(){
        NSLog(@"%@",testString);
    };
    block();
    
}
@end
