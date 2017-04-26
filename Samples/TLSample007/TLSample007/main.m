//
//  main.m
//  TLSample007
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
#import "TLBird.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TLBird *bird = [[TLBird alloc] init];
        bird.name = @"小小鸟";
        
        ((void (*)(id, SEL))objc_msgSend)((id)bird, @selector(sing));
    }
    return 0;
}
