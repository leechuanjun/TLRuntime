//
//  TLPeople.m
//  TLSample002
//
//  Created by lichuanjun on 2017/4/25.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "TLPeople.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation TLPeople

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    // 我们没有给TLPeople类声明sing方法，我们这里动态添加方法
    if ([NSStringFromSelector(sel) isEqualToString:@"sing"]) {
        class_addMethod(self, sel, (IMP)otherSing, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void otherSing(id self, SEL cmd)
{
    NSLog(@"%@ 唱歌啦！",((TLPeople *)self).name);
}

@end
