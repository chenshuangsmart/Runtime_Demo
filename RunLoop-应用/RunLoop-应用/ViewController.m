//
//  ViewController.m
//  RunLoop-应用
//
//  Created by chenshuang on 2018/9/11.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "PermanentThread.h"

@interface ViewController ()
/** 线程*/
@property(nonatomic,strong)PermanentThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 1.timer的运行模式
//    [self addTimer];
    
    [self addBtn];
    // 2.线程保活
    self.thread = [[PermanentThread alloc] init];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.thread executeTask:^{
        NSLog(@"执行任务 - %@", [NSThread currentThread]);
    }];
}

- (void)stopBtnClick {
    [self.thread stop];
}

// NSTimer运行模式
- (void)addTimer {
    static int count = 0;
    
    // 1.默认添加到default模式
    //    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
    //        NSLog(@"%d", ++count);
    //    }];
    
    // 2.添加到指定模式下
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%d", ++count);
    }];
    //    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    //    [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    
    // NSDefaultRunLoopMode、UITrackingRunLoopMode才是真正存在的模式
    // NSRunLoopCommonModes并不是一个真的模式，它只是一个标记
    // timer能在_commonModes数组中存放的模式下工作
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)addBtn {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [btn setTitle:@"停止" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(stopBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

@end
