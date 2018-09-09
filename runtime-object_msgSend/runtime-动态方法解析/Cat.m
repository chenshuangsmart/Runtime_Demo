//
//  Cat.m
//  runtime-动态方法解析
//
//  Created by chenshuang on 2018/9/9.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Cat.h"

@implementation Cat
- (int)test:(int)age {
    NSLog(@"%s",__func__);
    return age * age;
}
@end
