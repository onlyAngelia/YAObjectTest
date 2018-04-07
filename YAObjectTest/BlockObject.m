//
//  BlockObject.m
//  YAObjectTest
//
//  Created by lanjiying on 2018/3/29.
//  Copyright © 2018年 lanjiying_Anna. All rights reserved.
//

#import "BlockObject.h"
@interface BlockObject()

//@property(nonatomic, copy)void(^blockTest)(void);

@end
@implementation BlockObject
-(instancetype)init
{
    self = [super init];
    if (self) {
        
        void (^lockBlock)(void) = ^{
            NSLog(@"lockBlock");
        };
        lockBlock();
        
    }
    return self;
}

@end
