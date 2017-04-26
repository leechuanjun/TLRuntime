# TLRuntime
Objective-C Runtime是一个将C语言转化为面向对象语言的扩展。 我们将C++和Objective进行对比，虽然C++和Objective-C都是在C的基础上加入面向对象的特性扩充而成的程序设计语言，但二者实现的机制差异很大。C++是基于静态类型，而Objective-C是基于动态运行时类型。也就是说用C++编写的程序编译时就直接编译成了可令机器读懂的机器语言；用Objective-C编写的程序不能直接编译成可令机器读懂的机器语言，而是在程序运行的时候，通过Runtime把程序转为可令机器读懂的机器语言。也就是说用C++编写的程序通过编译器直接把函数地址硬编码进入可执行文件；而Objective-C无法通过编译器直接把函数地址硬编码进入可执行文件，而是在程序运行的时候，利用Runtime根据条件判断作出决定。函数标识与函数过程的真正内容之间的关联可以动态修改。Runtime是Objective不可缺少的重要一部分。

# 调用项目内容

## 1、Objective-C的元素认知
    1.1 id和Class
    1.2 SEL
    1.3 IMP
    1.4 Method
    1.5 Ivar
    1.6 objc_property_t
    1.7 Cache
    1.8 Catagory
    
## 2、Objective-C的消息传递
    2.1 基本消息传递
    2.2 消息动态解析
    
## 3、Runtime实战
    3.1 问好篇(TLSample001)
    3.2 特征篇(TLSample002)
    3.3 增加新技能篇(TLSample003)
    3.4 资料归档篇(TLSample004)
    3.5 资料转换篇(TLSample005)
    3.6 歌唱篇(验证一下上文《2.2 消息动态解析》TLSample006~TLSample008)
    
