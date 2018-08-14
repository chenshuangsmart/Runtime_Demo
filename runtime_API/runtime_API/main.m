//
//  main.m
//  runtime_API
//
//  Created by chenshuang on 2018/8/13.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "CSPersion.h"
#import "CSCar.h"

void run(id self, SEL _cmd) {
    NSLog(@"_____ %@ - %@", self, NSStringFromSelector(_cmd));
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // 1.获取成员变量信息
//        Ivar ageIvar = class_getInstanceVariable([CSPersion class], "_age");
//        NSLog(@"%s %s",ivar_getName(ageIvar),ivar_getTypeEncoding(ageIvar));
        
        // 2. 设置和获取成员变量的值
//        CSPersion *persion = [[CSPersion alloc] init];
//        Ivar nameIvar = class_getInstanceVariable([CSPersion class], "_name");
//        Ivar ageIvar = class_getInstanceVariable([CSPersion class], "_age");
//
//        object_setIvar(persion, nameIvar, @"123");
//        object_setIvar(persion, ageIvar, (__bridge id)(void *)10);
//        NSLog(@"%@ %d", persion.name, persion.age);
        
        // 3. 动态创建一个类
//        Class newClass = objc_allocateClassPair([NSObject class], "CSDog", 0);
//        // 添加属性
//        class_addIvar(newClass, "_age", 4, 1, @encode(int));
//        class_addIvar(newClass, "_weight", 4, 1, @encode(int));
//        // 添加方法
//        class_addMethod(newClass, @selector(run), (IMP)run, "v@:");
//        // 注册类
//        objc_registerClassPair(newClass);
//
//        id dog = [[newClass alloc] init];
//        [dog setValue:@10 forKey:@"_age"];
//        [dog setValue:@20 forKey:@"_weight"];
//        [dog run];
//
//        NSLog(@"%@ %@", [dog valueForKey:@"_age"], [dog valueForKey:@"_weight"]);
        
        // 在不需要这个类时释放
//        objc_disposeClassPair(newClass);
        
        // 4.成员变量的数量
        unsigned int count;
        Ivar *ivars = class_copyIvarList([CSPersion class], &count);
        for (int i = 0; i < count; i++) {
            // 取出i位置的成员变量
            Ivar ivar = ivars[i];
            NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
        }
        free(ivars);
    }
    return 0;
}


// 动态创建一个类（参数：父类，类名，额外的内存空间）
void creatClass() {
    // 动态创建一个类
    Class newClass = objc_allocateClassPair([NSObject class], "CSDog", 0);
    // 添加属性
    class_addIvar(newClass, "_age", 4, 1, @encode(int));
    class_addIvar(newClass, "_weight", 4, 1, @encode(int));
    // 添加方法
    class_addMethod(newClass, @selector(run), (IMP)run, "v@:");
    // 注册类
    objc_registerClassPair(newClass);
    
    id dog = [[newClass alloc] init];
    [dog setValue:@10 forKey:@"_age"];
    [dog setValue:@20 forKey:@"_weight"];
    [dog run];
    
    NSLog(@"%@ %@", [dog valueForKey:@"_age"], [dog valueForKey:@"_weight"]);
    
    // 在不需要这个类时释放
    objc_disposeClassPair(newClass);
}

// 获取设置Class
void setClass() {
    CSPersion *persion = [[CSPersion alloc] init];
    [persion run];
    
    object_setClass(persion, [CSCar class]);
    [persion run];
    
    object_getClass([CSPersion class]);
    
    NSLog(@"%p %p", object_getClass([CSPersion class]), [CSPersion class]);
    
    NSLog(@"%d %d %d",
          object_isClass(persion),
          object_isClass([CSPersion class]),
          object_isClass(object_getClass([CSPersion class]))
          );
}
