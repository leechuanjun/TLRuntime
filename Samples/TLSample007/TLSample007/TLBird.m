//
//  TLBird.m
//  TLSample007
//
//  Created by lichuanjun on 2017/4/25.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "TLBird.h"
#import "TLPeople.h"

@implementation TLBird

// 第一步：我们不动态添加方法，返回NO，进入第二步；
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    return NO;
}

// 第二部：我们不指定备选对象响应aSelector，进入第三步；
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return nil;
}

// 第三步：返回方法选择器，然后进入第四部；
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"sing"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

// 第四部：这步我们修改调用对象
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    // 我们改变调用对象为TLPeople
    TLPeople *liTeacher = [[TLPeople alloc] init];
    liTeacher.name = @"Lee Teacher";
    [anInvocation invokeWithTarget:liTeacher];
}

@end
