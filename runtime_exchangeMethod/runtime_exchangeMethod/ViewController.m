//
//  ViewController.m
//  runtime_exchangeMethod
//
//  Created by cs on 2018/8/18.
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
    [self addBtn];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self testMutableArray];
    [self testMutableDictionary];
}

- (void)addBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 200, 50);
    btn.center = self.view.center;
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick {
    NSLog(@"按钮点击了");
}

- (void)testMutableArray {
    NSString *obj = nil;
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"jack"];
    [array insertObject:obj atIndex:0];
}

- (void)testMutableDictionary {
    NSString *obj = nil;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"name"] = @"jack";
    dict[obj] = @"rose";
    dict[@"age"] = obj;

    NSLog(@"%@", dict);
    
    
    NSDictionary *dict1 = @{@"name" : [[NSObject alloc] init],
                           @"age" : @"jack"};
    NSString *value =  dict1[nil];
    
    NSLog(@"%@", [dict class]);
}

@end
