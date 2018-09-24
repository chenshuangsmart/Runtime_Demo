//
//  Person.m
//  runtime-method详解
//
//  Created by chenshuang on 2018/9/5.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)test {
    NSLog(@"%s",__func__);
}

- (int)test:(int)age height:(float)height {
    return age + height;
}
@end
