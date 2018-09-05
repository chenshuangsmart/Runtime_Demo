//
//  CSPersion.m
//  runtime_union_mask
//
//  Created by cs on 2018/8/20.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "CSPersion.h"

#define CSTallMask (1<<0)
#define CSRichMask (1<<1)
#define CSHandsomeMask (1<<2)
#define CSThinMask (1<<3)

@interface CSPersion() {
    union {
        int bits;
        struct {
            char tall : 4;  // 身高
            char rich : 4;  // 财富
            char handsome : 4;  // 帅
            char thin : 4;  // 体重
        };
    } _tallRichHandsome;
}

@end

@implementation CSPersion

- (void)setTall:(bool)tall {
    if (tall) {
        _tallRichHandsome.bits |= CSTallMask;   // 或上
    } else {
        _tallRichHandsome.bits &= ~CSTallMask;  // 与上
    }
}

- (bool)isTall {
    return !!(_tallRichHandsome.bits & CSTallMask); // 两个!!，转成Bool值类型
}

- (void)setRich:(bool)rich {
    if (rich) {
        _tallRichHandsome.bits |= CSRichMask;   // 或上
    } else {
        _tallRichHandsome.bits &= ~CSRichMask;  // 与上
    }
}

- (bool)isRich {
    return !!(_tallRichHandsome.bits & CSRichMask); // 两个!!，转成Bool值类型
}

- (void)setHandsome:(bool)handsome {
    if (handsome) {
        _tallRichHandsome.bits |= CSHandsomeMask;   // 或上
    } else {
        _tallRichHandsome.bits &= ~CSHandsomeMask;  // 与上
    }
}

- (bool)isHandsome {
    return !!(_tallRichHandsome.bits & CSHandsomeMask); // 两个!!，转成Bool值类型
}

- (void)setThin:(bool)thin {
    if (thin) {
        _tallRichHandsome.bits |= CSThinMask;   // 或上
    } else {
        _tallRichHandsome.bits &= ~CSThinMask;  // 与上
    }
}

- (bool)isThin {
    return !!(_tallRichHandsome.bits & CSThinMask); // 两个!!，转成Bool值类型
}
@end
