//
//  main.m
//  runtime-动态方法解析
//
//  Created by chenshuang on 2018/9/6.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "CSPerson.h"

// 1.动态方法解析
void test1() {
    Person *person = [[Person alloc] init];
    
    // 实例方法
    [person test];
    
    // 类方法
    [Person test];
}

// 2.实例方法消息转发
void test2() {
    // 2.消息转发
    Student *stu = [[Student alloc] init];
    [stu test:10];
}

// 3.类方法的转发
void test3() {
    [CSPerson test];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
    }
    return 0;
}
