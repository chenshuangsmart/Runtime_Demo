//
//  main.m
//  runtim-dynamic关键字
//
//  Created by chenshuang on 2018/9/9.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *per = [[Person alloc] init];
        per.age = 100;
        NSLog(@"age = %d",per.age);
        
        per.weight = 200;
        NSLog(@"weight = %f",per.weight);
    }
    return 0;
}
