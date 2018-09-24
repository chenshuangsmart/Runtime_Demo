//
//  main.m
//  runtime-method详解
//
//  Created by chenshuang on 2018/9/5.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"
#import "MJClassInfo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        
        mj_objc_class *cls = (__bridge mj_objc_class *)[Person class];
        class_rw_t *data = cls->data();
        
        // 1.SEL
//        SEL sel1 = sel_registerName("test");
//        SEL sel2 = @selector(test);
//        NSLog(@"%p %p %p",@selector(test),@selector(test),sel1);
        
        // 2.IMP
        [person test];
        
        // 3.types
        [person test:100 height:100];
        
        NSLog(@"end");
    }
    return 0;
}
