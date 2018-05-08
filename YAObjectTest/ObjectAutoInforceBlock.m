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
- (void)testTheLastVarOfBlock_impl_0
{
    NSString *string = @"Just for test";
    void (^block)(void)= ^(){
        NSLog(@"%@",string);
    };
    
}
@end
