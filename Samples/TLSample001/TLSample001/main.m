//
//  main.m
//  TLSample001
//
//  Created by lichuanjun on 2017/4/24.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

// 自定义一个方法
void sayFunction(id self, SEL _cmd, id some) {
    NSLog(@"%@岁的%@说：%@", object_getIvar(self, class_getInstanceVariable([self class], "_age")),[self valueForKey:@"name"],some);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 动态创建对象 创建一个People 继承自 NSObject类
        Class TLPeople = objc_allocateClassPair([NSObject class], "People", 0);
        
        // 为该类添加NSString *_name成员变量
        class_addIvar(TLPeople, "_name", sizeof(NSString*), log2(sizeof(NSString*)), @encode(NSString*));
        // 为该类添加int _age成员变量
        class_addIvar(TLPeople, "_age", sizeof(int), sizeof(int), @encode(int));
        
        // 注册方法名为say的方法
        SEL selSay = sel_registerName("say:");
        // 为该类增加名为say的方法
        class_addMethod(TLPeople, selSay, (IMP)sayFunction, "v@:@");
        
        // 注册该类
        objc_registerClassPair(TLPeople);
        
        // 创建一个类的实例
        id tlPeopleInstance = [[TLPeople alloc] init];
        
        // KVC 动态改变 对象peopleInstance 中的实例变量
        [tlPeopleInstance setValue:@"TridonLee" forKey:@"name"];
        
        // 从类中获取成员变量Ivar
        Ivar ageIvar = class_getInstanceVariable(TLPeople, "_age");
        // 为tlPeopleInstance的成员变量赋值
        object_setIvar(tlPeopleInstance, ageIvar, @18);
        
        // 调用 tlPeopleInstance 对象中的 selSay 方法选择器对于的方法
//        objc_msgSend(tlPeopleInstance, selSay, @"大家好!"); // 这样写也可以
        ((void (*)(id, SEL, id))objc_msgSend)(tlPeopleInstance, selSay, @"大家好");
        tlPeopleInstance = nil; //当TLPeople类或者它的子类的实例还存在，则不能调用objc_disposeClassPair这个方法；因此这里要先销毁实例对象后才能销毁类；
        
        // 销毁类
        objc_disposeClassPair(TLPeople);
    }
    return 0;
}
