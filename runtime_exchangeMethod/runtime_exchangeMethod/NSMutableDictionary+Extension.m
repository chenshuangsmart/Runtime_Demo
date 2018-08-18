//
//  NSMutableDictionary+Extension.m
//  runtime_exchangeMethod
//
//  Created by cs on 2018/8/18.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "NSMutableDictionary+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Extension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSDictionaryM");
        Method method1 = class_getInstanceMethod(cls, @selector(setObject:forKeyedSubscript:));
        Method method2 = class_getInstanceMethod(cls, @selector(cs_setObject:forKeyedSubscript:));
        method_exchangeImplementations(method1, method2);
        
        Class cls2 = NSClassFromString(@"__NSDictionaryI");
        Method method3 = class_getInstanceMethod(cls2, @selector(objectForKeyedSubscript:));
        Method method4 = class_getInstanceMethod(cls2, @selector(cs_objectForKeyedSubscript:));
        method_exchangeImplementations(method3, method4);
    });
}

- (void)cs_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (!key) {
        return;
    }
    
    [self cs_setObject:obj forKeyedSubscript:key];
}

- (id)cs_objectForKeyedSubscript:(id)key {
    if (!key) {
        return nil;
    }
    
    return [self cs_objectForKeyedSubscript:key];
}

@end
