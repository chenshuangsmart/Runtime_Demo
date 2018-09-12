//
//  PermanentThread.m
//  RunLoop-应用
//
//  Created by chenshuang on 2018/9/12.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "PermanentThread.h"

/** CSThread **/
@interface CSThread : NSThread
@end
@implementation CSThread
- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end

@interface PermanentThread()
/** 线程*/
@property(nonatomic,strong)CSThread *thread;
/** 是否停止*/
@property(nonatomic,assign, getter=isStopped)BOOL stopped;
@end

@implementation PermanentThread

// 初始化方法
- (instancetype)init {
    self = [super init];
    if (self) {
        self.stopped = NO;
        
        // 初始化线程
        __weak typeof(self) weakSelf = self;
        self.thread = [[CSThread alloc] initWithBlock:^{
            // runloop只有添加事件才会执行
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
            
            // 当当前对象存在并且变量为false的时候,才一直执行
            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
        }];
        
        // 开启线程
        [self.thread start];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    
    [self stop];
}

#pragma mark - public method

// 执行任务
- (void)executeTask:(PermanentThreadTask)task {
    // 如果线程释放或者无任务,则退出
    if (!self.thread || !task) {
        return;
    }
    
    // 开始执行任务
    [self performSelector:@selector(innerExecuteTask:) onThread:self.thread withObject:task waitUntilDone:NO];
}

// 停止
- (void)stop {
    if (!self.thread) {
        return;
    }
    
    [self performSelector:@selector(innerStop) onThread:self.thread withObject:nil waitUntilDone:YES];
}

#pragma mark - private method

// 执行任务
- (void)innerExecuteTask:(PermanentThreadTask)task {
    task();
}

// 停止线程 runloop
- (void)innerStop {
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}

@end
