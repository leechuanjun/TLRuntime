//
//  main.m
//  TLSample004
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
        
        TLPeople *robertTeacher = [[TLPeople alloc] init];
        robertTeacher.name = @"罗伯特";
        robertTeacher.age = @46;
        robertTeacher.occupation = @"教授";
        robertTeacher.nationality = @"美国";
        
        NSString *path = NSHomeDirectory();
        path = [NSString stringWithFormat:@"%@/robertTeacher",path];
        // 归档
        [NSKeyedArchiver archiveRootObject:robertTeacher toFile:path];
        // 解归档
        TLPeople *teacher = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"热烈欢迎，从%@远道而来的%@岁的%@%@",teacher.nationality,teacher.age,teacher.name,teacher.occupation);
    }
    return 0;
}
