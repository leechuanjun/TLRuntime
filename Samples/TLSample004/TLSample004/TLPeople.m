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

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([TLPeople class], &count);
    for (NSUInteger i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([TLPeople class], &count);
        for (NSUInteger i = 0; i < count; i ++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

@end
