//
//  Person.h
//  runtime-method详解
//
//  Created by chenshuang on 2018/9/5.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (void)test;

// "i24@0:8i16f20"
// 0id 8SEL 16int 20float  == 24
- (int)test:(int)age height:(float)height;

@end
