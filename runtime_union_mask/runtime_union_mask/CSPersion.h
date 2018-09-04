//
//  CSPersion.h
//  runtime_union_mask
//
//  Created by cs on 2018/8/20.
//  Copyright © 2018年 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSPersion : NSObject

- (void)setTall:(bool)tall;
- (void)setRich:(bool)rich;
- (void)setHandsome:(bool)handsome;
- (void)setThin:(bool)thin;

- (bool)isTall;
- (bool)isRich;
- (bool)isHandsome;
- (bool)isThin;

@end
