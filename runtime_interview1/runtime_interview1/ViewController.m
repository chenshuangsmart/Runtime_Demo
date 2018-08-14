//
//  ViewController.m
//  runtime_interview1
//
//  Created by chenshuang on 2018/8/13.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "CSPersion.h"
#import <objc/runtime.h>
#import "NSObject+Json.h"
#import "CSCar.h"

@interface ViewController ()

@end

void myRun() {
    NSLog(@"---myRun---");
}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 动态添加方法
//    [self resolveUnDefindMethod];
    
    // 查看私有成员变量
//    [self checkPrivityVariable];
    
    // 改变UITextFie占位文字颜色
//    [self setTextFieldPlaceholderTextColor];
    
    // 字典转模型
//    [self jsonToModel];
    
    // 替换方法的实现
    [self replaceMethod];
    
}

- (void)resolveUnDefindMethod {
    // insert code here...
    CSPersion *persion = [[CSPersion alloc] init];
    
    [persion test];
    
    [persion missMethod];
    
//    [CSPersion eat];
}

// 查看私有成员变量
- (void)checkPrivityVariable {
    unsigned int count;
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i < count; i++) {
        // 取出i位置的成员变量
        Ivar ivar = ivars[i];
        NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    free(ivars);
}

// 设置TextField占位符文字颜色
- (void)setTextFieldPlaceholderTextColor {
    UITextField *textF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    textF.layer.borderWidth = 1;
    textF.layer.borderColor = [UIColor blackColor].CGColor;
    textF.center = CGPointMake(self.view.bounds.size.width * 0.5, 150);
    textF.placeholder = @"请输入用户名";
    [self.view addSubview:textF];
    
    // 法一
//    [textF setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    // 法二
//    UILabel *placeholderLbe = [textF valueForKeyPath:@"_placeholderLabel"];
//    placeholderLbe.textColor = [UIColor redColor];
    
    // 法三
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    textF.attributedPlaceholder =  [[NSMutableAttributedString alloc] initWithString:@"请输入用户名" attributes:attrs];
}

// 字典转模型
- (void)jsonToModel {
    // 字典转模型
    NSDictionary *json = @{
                           @"id" : @20,
                           @"age" : @20,
                           @"weight" : @60,
                           @"name" : @"Jack",
                           @"no" : @30
                           };
    CSPersion *persion = [CSPersion cs_objectWithJson:json];
    NSLog(@"id = %d, age = %d, weight = %d, name = %@",persion.ID,persion.age,persion.weight,persion.name);
}

// 替换方法的实现
- (void)replaceMethod {
    CSCar *car = [[CSCar alloc] init];
    
    // 方法一
//    class_replaceMethod([CSCar class], @selector(run), (IMP)myRun, "V");
    
    // 方法二
//    class_replaceMethod([CSCar class], @selector(run), imp_implementationWithBlock(^{
//        NSLog(@"123123");
//    }), "v");
    
    // 方法三
    Method runMethod = class_getInstanceMethod([CSCar class], @selector(run));
    Method testMethod = class_getInstanceMethod([CSCar class], @selector(test));
    method_exchangeImplementations(runMethod, testMethod);
    
    [car run];
}

@end
