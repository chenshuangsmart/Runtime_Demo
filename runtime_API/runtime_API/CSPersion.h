//
//  CSPersion.h
//  runtime_API
//
//  Created by chenshuang on 2018/8/13.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPersion : NSObject
@property (assign, nonatomic) int ID;
@property (assign, nonatomic) int weight;
@property (assign, nonatomic) int age;
@property (copy, nonatomic) NSString *name;
- (void)run;
@end
