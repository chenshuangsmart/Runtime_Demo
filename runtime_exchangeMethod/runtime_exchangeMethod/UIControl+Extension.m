//
//  UIControl+Extension.m
//  runtime_exchangeMethod
//
//  Created by cs on 2018/8/18.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

@implementation UIControl (Extension)

+ (void)load {
    // hork:钩子函数
    Method method1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method2 = class_getInstanceMethod(self, @selector(cs_sendAction:to:forEvent:));
    method_exchangeImplementations(method1, method2);
}

- (void)cs_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"%@-%@-%@", self, target, NSStringFromSelector(action));
    
    // 调用系统原理的实现
    [self cs_sendAction:action to:target forEvent:event];
    
//    if ([self isKindOfClass:[UIButton class]]) {
//        // 拦截了所有按钮的事件
//    }
}

@end
