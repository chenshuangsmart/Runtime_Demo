//
//  main.m
//  runtime-cache
//
//  Created by chenshuang on 2018/9/5.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "GoodStudent.h"
#import "MJClassInfo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GoodStudent *goodStudent = [[GoodStudent alloc] init];
        mj_objc_class *goodStudentClass = (__bridge mj_objc_class *)[GoodStudent class];
        
        // 1. _mask的数量
        [goodStudent goodStudentTest];
        [goodStudent studentTest];
        [goodStudent personTest];
        [goodStudent goodStudentTest];
        [goodStudent studentTest];
        [goodStudent personTest];
        NSLog(@"--------------------------");
        
        // 2.打印bucket_t的值
//        cache_t cache = goodStudentClass->cache;
//        bucket_t *buckets = cache._buckets;
//        for (int i = 0; i <= cache._mask; i++) {
//            bucket_t bucket = buckets[i];
//            NSLog(@"%s %p", bucket._key, bucket._imp);
//        }
        
        // 3.通过cache.imp找到方法
        cache_t cache = goodStudentClass->cache;
        NSLog(@"%s %p", @selector(personTest), cache.imp(@selector(personTest)));
        NSLog(@"%s %p", @selector(studentTest), cache.imp(@selector(studentTest)));
        NSLog(@"%s %p", @selector(goodStudentTest), cache.imp(@selector(goodStudentTest)));
        
        NSLog(@"end");
    }
    return 0;
}
