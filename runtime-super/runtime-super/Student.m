//
//  Student.m
//  runtime-super
//
//  Created by chenshuang on 2018/9/9.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Student.h"

@implementation Student

/*
 [super message]的底层实现
 1.消息接收者仍然是子类对象
 2.从父类开始查找方法的实现
 */

struct objc_super {
    __unsafe_unretained _Nonnull id receiver; // 消息接收者
    __unsafe_unretained _Nonnull Class super_class; // 消息接收者的父类
};

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"[self class] = %@", [self class]); // Student
        NSLog(@"[self superclass] = %@", [self superclass]); // Person
        
        NSLog(@"--------------------------------");
        
        // objc_msgSendSuper({self, [Person class]}, @selector(class));
        NSLog(@"[super class] = %@", [super class]); // Student
        NSLog(@"[super superclass] = %@", [super superclass]); // Person
    }
    return self;
}

- (void)run {
    // super调用的receiver仍然是MJStudent对象
    [super run];
    
//    struct objc_super arg = {self, [Person class]};
//
//    objc_msgSendSuper(arg, @selector(run));
//
//    NSLog(@"MJStudet.......");
}

//@implementation NSObject
//- (Class)class
//{
//    return object_getClass(self);
//}
//
//- (Class)superclass
//{
//    return class_getSuperclass(object_getClass(self));
//}
//@end

@end
