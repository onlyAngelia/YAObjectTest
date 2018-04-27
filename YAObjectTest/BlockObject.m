//
//  BlockObject.m
//  YAObjectTest
//
//  Created by lanjiying on 2018/3/29.
//  Copyright © 2018年 lanjiying_Anna. All rights reserved.
//

#import "BlockObject.h"
#import <objc/runtime.h>

void(^globalBlock)(void) =^{};
typedef void(^defineGlobalBlock)(int);

@interface BlockObject()

@property(nonatomic, copy)void(^testBlock)(void);

@end
@implementation BlockObject
+ (void)load
{
    Class class = self.class;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        //1.第一步探究Block实质，这里仅仅是为了测试方便，正式代码中最好不要在init中直接写大量代码
//        void (^lockBlock)(void) = ^{
//
//        };
//        lockBlock();
        [self blockTestAllkindsofCase];

        
    }
    return self;
}
- (void)blockTestAllkindsofCase
{
    //globalBlockTest
    //1.globalBlock 调用时候不引入外部变量
//    defineGlobalBlock block = ^(){
//
//    };
    _testBlock = ^(){
        
    };
    NSInteger blockOut = 1;
   
    defineGlobalBlock block = ^(int count){
       
    };
    __block int a = 0;
    void (^lockBlock)(void) = ^{
    };
    lockBlock();
}
+ (void)testPramsBlock:(void(^)(void))paramBlock
{
    paramBlock();
}
@end
