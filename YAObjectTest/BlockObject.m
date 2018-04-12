//
//  BlockObject.m
//  YAObjectTest
//
//  Created by lanjiying on 2018/3/29.
//  Copyright © 2018年 lanjiying_Anna. All rights reserved.
//

#import "BlockObject.h"
#import <objc/runtime.h>

void(^blockTest)(void) =^{};

@interface BlockObject()

@property(nonatomic, copy)void(^testBlock)(void);

@end
@implementation BlockObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        //这里仅仅是为了测试方便，正式代码中最好不要在init中直接写大量代码
//        void (^lockBlock)(void) = ^{
//
//        };
//        lockBlock();
        
    }
    return self;
}
- (void)blockTestAllkindsofCase
{
    __block int a = 0;
    void (^lockBlock)(void) = ^{
         NSLog(@"%d",a);
    };
    lockBlock();
}
- (void)testPramsBlock:(void(^)(void))paramBlock
{
    paramBlock();
}
@end
