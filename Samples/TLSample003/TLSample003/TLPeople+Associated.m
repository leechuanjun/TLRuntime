//
//  TLPeople+Associated.m
//  TLSample003
//
//  Created by lichuanjun on 2017/4/25.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "TLPeople+Associated.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation TLPeople (Associated)

-(void)setAssociatedBust:(NSNumber *)associatedBust
{
    // 设置关联对象
    objc_setAssociatedObject(self, @selector(associatedBust), associatedBust, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)associatedBust
{
    // 得到关联对象
    return objc_getAssociatedObject(self, @selector(associatedBust));
}

-(void)setAssociatedCallBack:(CodingCallBack)associatedCallBack
{
    objc_setAssociatedObject(self, @selector(associatedCallBack), associatedCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CodingCallBack)associatedCallBack
{
    return objc_getAssociatedObject(self, @selector(associatedCallBack));
}

@end
