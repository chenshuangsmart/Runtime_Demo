//
//  main.m
//  runtime-super
//
//  Created by chenshuang on 2018/9/9.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import <objc/runtime.h>

//@implementation NSObject
//
//- (BOOL)isMemberOfClass:(Class)cls {
//    return [self class] == cls;
//}
//
//- (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = [self class]; tcls; tcls = tcls->superclass) {
//        if (tcls == cls) return YES;
//    }
//    return NO;
//}
//
//+ (BOOL)isMemberOfClass:(Class)cls {
//    return object_getClass((id)self) == cls;
//}
//
//+ (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = object_getClass((id)self); tcls; tcls = tcls->superclass) {
//        if (tcls == cls) return YES;
//    }
//    return NO;
//}
//
//@end

// 1.super的实现
void test1() {
    Student *stu = [[Student alloc] init];
}

// 2. 拦截未实现的方法
void test2() {
    Person *per = [[Person alloc] init];
    [per run];
    [per test1];
    [per test2];
}

// 3. isKindOfClass 和 isMemberOfClass的理解
void test3() {
    // 和下面的等价
//    NSLog(@"%d", [[NSObject class] isKindOfClass:[NSObject class]]);
//    NSLog(@"%d", [[NSObject class] isMemberOfClass:[NSObject class]]);
//    NSLog(@"%d", [[Person class] isKindOfClass:[Person class]]);
//    NSLog(@"%d", [[Person class] isMemberOfClass:[Person class]]);
    
    // 这句代码的方法调用者不管是哪个类（只要是NSObject体系下的），都返回YES
//    NSLog(@"%d", [NSObject isKindOfClass:[NSObject class]]); // 1
//    NSLog(@"%d", [NSObject isMemberOfClass:[NSObject class]]); // 0
//    NSLog(@"%d", [Person isKindOfClass:[Person class]]); // 0
//    NSLog(@"%d", [Person isMemberOfClass:[Person class]]); // 0
    
    // 实例对象
    id person = [[Person alloc] init];
    NSLog(@"%d", [person isMemberOfClass:[Person class]]);
    NSLog(@"%d", [person isMemberOfClass:[NSObject class]]);
    NSLog(@"%d", [person isKindOfClass:[Person class]]);
    NSLog(@"%d", [person isKindOfClass:[NSObject class]]);
    
    NSLog(@"------------类对象-------------");
    // 类对象
    NSLog(@"%d", [Person isKindOfClass:[NSObject class]]);
    NSLog(@"%d", [Person isMemberOfClass:[NSObject class]]);
    NSLog(@"%d", [Person isMemberOfClass:object_getClass([Person class])]);
    NSLog(@"%d", [Person isKindOfClass:object_getClass([NSObject class])]);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 1.super的实现
//        test1();
        
        // 2.拦截未实现的方法
//        test2();
        
        // isKindOfClass 和 isMemberOfClass的理解
        test3();
    }
    return 0;
}
