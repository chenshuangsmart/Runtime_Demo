//
//  PermanentThread.h
//  RunLoop-应用
//
//  Created by chenshuang on 2018/9/12.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

// 声明一个block - 用于执行任务
typedef void(^PermanentThreadTask)(void);

/** 线程保活 */
@interface PermanentThread : NSObject

// 在当前线程执行一个任务
- (void)executeTask:(PermanentThreadTask)task;

// 结束线程
- (void)stop;

@end
