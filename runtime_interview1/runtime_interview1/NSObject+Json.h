//
//  NSObject+Json.h
//  runtime_interview1
//
//  Created by chenshuang on 2018/8/13.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Json)

+ (instancetype)cs_objectWithJson:(NSDictionary *)json;

@end
