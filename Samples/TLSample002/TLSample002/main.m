//
//  main.m
//  TLSample002
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
        liTeacher.name = @"TridonLee";
        liTeacher.age = 18;
        [liTeacher setValue:@"Teacher" forKey:@"occupation"];
        
        NSDictionary *propertyResultDic = [liTeacher allProperties];
        for (NSString *propertyName in propertyResultDic.allKeys) {
            NSLog(@"propertyName:%@, propertyValue:%@",propertyName, propertyResultDic[propertyName]);
        }
        
        NSDictionary *ivarResultDic = [liTeacher allIvars];
        for (NSString *ivarName in ivarResultDic.allKeys) {
            NSLog(@"ivarName:%@, ivarValue:%@",ivarName, ivarResultDic[ivarName]);
        }
        
        NSDictionary *methodResultDic = [liTeacher allMethods];
        for (NSString *methodName in methodResultDic.allKeys) {
            NSLog(@"methodName:%@, argumentsCount:%@", methodName, methodResultDic[methodName]);
        }
    }
    return 0;
}
