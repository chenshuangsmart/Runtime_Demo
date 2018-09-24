//
//  NSMutableArray+Extension.m
//  runtime_exchangeMethod
//
//  Created by cs on 2018/8/18.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Extension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
        Class cls = NSClassFromString(@"__NSArrayM");
        Method method1 = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
        Method method2 = class_getInstanceMethod(cls, @selector(cs_insertObject:atIndex:));
        method_exchangeImplementations(method1, method2);
    });
}

- (void)cs_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        return;
    }
    
    [self cs_insertObject:anObject atIndex:index];
}

@end
