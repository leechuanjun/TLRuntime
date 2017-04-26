//
//  main.m
//  TLSample003
//
//  Created by lichuanjun on 2017/4/25.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLPeople.h"
#import "TLPeople+Associated.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TLPeople *tlTeacher = [[TLPeople alloc] init];
        tlTeacher.name = @"TridonLee";
        tlTeacher.age = 18;
        [tlTeacher setValue:@"Teacher" forKey:@"occupation"];
        tlTeacher.associatedBust = @(90);
        tlTeacher.associatedCallBack = ^(){
            
            NSLog(@"TridonLee Teacher 要写代码了！");
            
        };
        tlTeacher.associatedCallBack();
        
        NSDictionary *propertyResultDic = [tlTeacher allProperties];
        for (NSString *propertyName in propertyResultDic.allKeys) {
            NSLog(@"propertyName:%@, propertyValue:%@",propertyName, propertyResultDic[propertyName]);
        }
        
        NSDictionary *methodResultDic = [tlTeacher allMethods];
        for (NSString *methodName in methodResultDic.allKeys) {
            NSLog(@"methodName:%@, argumentsCount:%@", methodName, methodResultDic[methodName]);
        }
    }
    return 0;
}
