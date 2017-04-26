//
//  main.m
//  TLSample008
//
//  Created by lichuanjun on 2017/4/25.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "TLPeople.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TLPeople *liTeacher = [[TLPeople alloc] init];
        liTeacher.name = @"LiTeacher";
        ((void(*)(id, SEL)) objc_msgSend)((id)liTeacher, @selector(sing));
    }
    return 0;
}
