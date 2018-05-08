//
//  BlockObject.m
//  YAObjectTest
//
//  Created by lanjiying on 2018/3/29.
//  Copyright © 2018年 lanjiying_Anna. All rights reserved.
//

#import "BlockObject.h"
#import <objc/runtime.h>
#import "BlockIncludedInOC.hpp"

static BlockIncludedInOC *blockInCluded = NULL;
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
        [self testBlockAutomaticInterceptVar];
        
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
        count = 1000;
        return count;
    };
     NSLog(@"%@",blk);
    
    //不使用外部截获变量
    blockStatic secondBlk = ^(){
        return 1;
    };
    NSLog(@"%@",secondBlk);
    
    
    int a = 1;
    //使用外部其它变量情况
    void (^blockVariable)(void) = ^(){
        NSLog(@"%ld",(long)_outsideCount);
    };
    NSLog(@"%@",blockVariable);
    
    _proBlock = ^(){
        NSLog(@"%d",a);
    };
    NSLog(@"%@",_proBlock);
    
    if (!blockInCluded) {
        blockInCluded = new BlockIncludedInOC();
    }
    
    
    //autoBlock
    void (^autoBlock)(void) = ^{
      blockInCluded -> testAutoBlock();
    };
    autoBlock();
    NSLog(@"%@",autoBlock);
}
- (void)testBlockAutomaticInterceptVar
{
    __block int a = 0;
    void (^lockBlock)(void) = ^{
        a = 2;
    };
    lockBlock();
    NSLog(@"%@", lockBlock);
}
- (void)dealloc{
    if (blockInCluded) {
        delete blockInCluded;
    }
}
@end
