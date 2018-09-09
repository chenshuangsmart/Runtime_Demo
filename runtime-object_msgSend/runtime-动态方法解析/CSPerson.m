//
//  CSPerson.m
//  runtime-动态方法解析
//
//  Created by chenshuang on 2018/9/9.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "CSPerson.h"
#import <objc/runtime.h>
#import "CSCat.h"

@implementation CSPerson

+ (id)forwardingTargetForSelector:(SEL)aSelector {
    // objc_msgSend([[MJCat alloc] init], @selector(test))
    // [[[MJCat alloc] init] test]
    // 该方法显示与注释后有不同的结果
//    if (aSelector == @selector(test)) {
//        return [[CSCat alloc] init];
//    }
    
    return [super forwardingTargetForSelector:aSelector];
}

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }

    return [super methodSignatureForSelector:aSelector];
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"1123");
}
@end
