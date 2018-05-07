//
//  BlockIncludedInOC.cpp
//  YAObjectTest
//
//  Created by lanjiying on 2018/5/6.
//  Copyright © 2018年 lanjiying_Anna. All rights reserved.
//

#include "BlockIncludedInOC.hpp"
#include <iostream>

int __attribute__((constructor))returnAutomaticPrivarty(){
    return 120;
}

void testAutoBlock(){
    
    int * b=new int[4];
    __block int testCount = 100;
    int (^myBlock)() = ^() {
        b[0] = testCount;
        b[1] = testCount + 1;
        b[2] = testCount + 2;
        b[3] = testCount + 3;
        std::cout<<b<<std::endl;
       return 0;
        
    };
    std::cout<<myBlock<<std::endl;
    
}

void testFinalizingBlock(){
    
}
void testWeakBlock(){
    
    __block int x = 123;
    void (^printXandY)(int) = ^(int y) {
        x = x + y;
        printf("%d %d\n", x, y);
    };
    printXandY(456);
    std::cout<<printXandY<<std::endl;
}
int main()
{
    testAutoBlock();
    testFinalizingBlock();
    testWeakBlock();
    
    return 0;
}
