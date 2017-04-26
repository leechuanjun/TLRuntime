//
//  TLPeople.h
//  TLSample002
//
//  Created by lichuanjun on 2017/4/25.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLPeople : NSObject

@property (nonatomic, copy) NSString *name; // 姓名
@property (nonatomic, strong) NSNumber *age; // 年龄
@property (nonatomic, copy) NSString *occupation; // 职业
@property (nonatomic, copy) NSString *nationality; // 国籍

// 生成model
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

// 转换成字典
- (NSDictionary *)covertToDictionary;

@end
