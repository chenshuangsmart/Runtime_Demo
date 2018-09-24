//
//  Student.m
//  runtime-动态方法解析
//
//  Created by chenshuang on 2018/9/9.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
#import "Cat.h"

@implementation Student

//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    class_addMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test:)) {
        
        // 测试一
//        return [NSMethodSignature signatureWithObjCTypes:"v20@0:8i16"];
        
        // 测试二
//        return [NSMethodSignature signatureWithObjCTypes:"i@:i"];
        
        // 测试三
        return [[[Cat alloc] init] methodSignatureForSelector:aSelector];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 参数顺序：receiver、selector、other arguments
    
    // 测试一
//    int age;
//    [anInvocation getArgument:&age atIndex:2];
//    NSLog(@"%d", age + 10);
    
    // 测试二
    // anInvocation.target == [[MJCat alloc] init]
    // anInvocation.selector == test:
    // anInvocation的参数：15
//    [[[Cat alloc] init] test:15];
    
    // 测试三
    [anInvocation invokeWithTarget:[[Cat alloc] init]];
    int ret;
    [anInvocation getReturnValue:&ret];
    NSLog(@"%d", ret);
}

@end
