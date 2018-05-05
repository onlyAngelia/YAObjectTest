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

@property (nonatomic, weak)void(^proBlock)(void);
@property (nonatomic, assign)NSInteger outsideCount;

@end
@implementation BlockObject
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self initProperties];
        [self blockTestAllkindsofCase];
        
    }
    return self;
}
- (void)initProperties
{
    _outsideCount = 0;
}
- (void)blockTestAllkindsofCase
{
    
    [self testBlocksubstance];//1.第一步探究Block实质从init
    [self testBlockKinds];//2.探究block类型
    [self testBlockAutomaticInterceptVar];//3.探究自动截获变量
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
    
    
    int a = 1;
    //使用外部局部变量情况
    void (^blockVariable)(void) = ^(){
        NSLog(@"%ld",(long)_outsideCount);
    };
    NSLog(@"%@",blockVariable);
    
    _proBlock = ^(){
        NSLog(@"%d",a);
    };
    NSLog(@"%@",_proBlock);
    
}
- (void)testBlockAutomaticInterceptVar
{
    __block int a = 0;
    void (^lockBlock)(void) = ^{
        a++;
    };
    lockBlock();
    NSLog(@"%@", lockBlock);
}
+ (void)testPramsBlock:(void(^)(void))paramBlock
{
    paramBlock();
}
@end
