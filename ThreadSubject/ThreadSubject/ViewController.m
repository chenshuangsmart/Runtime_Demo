//
//  ViewController.m
//  ThreadSubject
//
//  Created by cs on 2018/8/20.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self test1];
    [self test2];
}

// FIFO
- (void)test1 {
    NSLog(@"code -> A");
    dispatch_async(dispatch_get_global_queue(2, 0), ^{
        NSLog(@"code -> B");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"code -> C");
            
        });
    });
    
    NSLog(@"code -> D");
    NSLog(@"code -> E");
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"code -> F");
    }
}

// main thread lock
- (void)test2 {
    NSLog(@"code -> A");
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"code -> B");
    });
    
    NSLog(@"code -> C");
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"code -> D");
    }
}

@end
