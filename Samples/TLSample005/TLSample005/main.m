//
//  main.m
//  TLSample005
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
        
        NSDictionary *dict = @{
                               @"name" : @"苍井空",
                               @"age"  : @18,
                               @"occupation" : @"老师",
                               @"nationality" : @"日本"
                               };
        
        // 字典转模型
        TLPeople *cangTeacher = [[TLPeople alloc] initWithDictionary:dict];
        NSLog(@"热烈欢迎，从%@远道而来的%@岁的%@%@",cangTeacher.nationality,cangTeacher.age,cangTeacher.name,cangTeacher.occupation);
        
        // 模型转字典
        NSDictionary *covertedDict = [cangTeacher covertToDictionary];
        NSLog(@"%@",covertedDict);
        
    }
    return 0;
}
