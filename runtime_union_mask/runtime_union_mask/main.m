//
//  main.m
//  runtime_union_mask
//
//  Created by cs on 2018/8/20.
//  Copyright © 2018年 cs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSPersion.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        CSPersion *persion = [[CSPersion alloc] init];
        persion.tall = YES;
        persion.rich = NO;
        persion.handsome = YES;
        persion.thin = NO;

        NSLog(@"tall:%d rich:%d handsome:%d thin:%d", persion.isTall, persion.isRich, persion.isHandsome, persion.isThin);
    }
    return 0;
}
