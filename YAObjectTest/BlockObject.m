//
//  BlockObject.m
//  YAObjectTest
//
//  Created by lanjiying on 2018/3/29.
//  Copyright © 2018年 lanjiying_Anna. All rights reserved.
//

#import "BlockObject.h"
#import <objc/runtime.h>

void (^globalBlock)(void)=^{};
static int count = 100;
@interface BlockObject()

@property(nonatomic, copy)void(^proBlock)(void);

@end
@implementation BlockObject
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self blockTestAllkindsofCase];
        
    }
    return self;
}
- (void)blockTestAllkindsofCase
{
    
    [self testBlocksubstance];//1.第一步探究Block实质从init
    [self testBlockKinds];//2.探究block类型

}
- (void)testBlocksubstance
{
    void (^lockBlock)(void) = ^{
        
    };
    lockBlock();
}
- (void)testBlockKinds
{
    //只引用外部静态变量的block也是GlobalBlock
    typedef int (^blockStatic)(void);
    blockStatic blk = ^(){
        return count;
    };
     NSLog(@"%@",blk);
    //不使用外部截获变量
    blockStatic secondBlk = ^(){
        return 1;
    };
    NSLog(@"%@",secondBlk);
    
    _proBlock = ^(){
        
    };
    
}
- (void)testBlockAutomaticInterceptVar
{
    __block int a = 0;
    void (^lockBlock)(void) = ^{
        a++;
    };
    lockBlock();
}
+ (void)testPramsBlock:(void(^)(void))paramBlock
{
    paramBlock();
}
@end
