//
//  CSPersion.m
//  runtime_interview1
//
//  Created by cs on 2018/8/13.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "CSPersion.h"
#import <objc/runtime.h>

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@" >> dynamicMethodIMP");
}

@implementation CSPersion

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@" >> Instance resolving %@", NSStringFromSelector(sel));
    
    if (sel == @selector(missMethod)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@" >> Class resolving %@", NSStringFromSelector(sel));
    
    if (sel == @selector(eat)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

- (void)test {
    NSLog(@"test ...");
}

@end
