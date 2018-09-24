//
//  ViewController.m
//  rumtime_isa_desc
//
//  Created by cs on 2018/8/21.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "ViewController.h"
#import "CSPerson.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CSPerson *person = [[CSPerson alloc] init];
    
    // 弱引用对象
    __weak typeof(person) weakPerson = person;

    // 关联对象
    objc_setAssociatedObject(person, @selector(hello), @"Hello", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSLog(@"创建了一个新的实例对象");
}

@end
