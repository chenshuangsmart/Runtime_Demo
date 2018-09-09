//
//  Person.m
//  runtim-dynamic关键字
//
//  Created by chenshuang on 2018/9/9.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person
// 会默认生成带下划线的变量和set方法get方法
@synthesize age = _age;

// 提醒编译器不要自动生成setter和getter的实现、不要自动生成成员变量
@dynamic weight;

void setWeight(id self, SEL _cmd, int weight) {
    NSLog(@"weight is %d", weight);
}

int weight(id self, SEL _cmd) {
    return 120;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(setWeight:)) {
        class_addMethod(self, sel, (IMP)setWeight, "v@:i");
        return YES;
    } else if (sel == @selector(weight)) {
        class_addMethod(self, sel, (IMP)weight, "i@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (void)setAge:(int)age {
    _age = age;
}

-(int)age {
    return _age;
}

@end
