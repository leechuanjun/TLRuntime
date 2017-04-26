//
//  TLPeople+Associated.h
//  TLSample003
//
//  Created by lichuanjun on 2017/4/25.
//  Copyright © 2017年 lichuanjun. All rights reserved.
//

#import "TLPeople.h"

typedef void (^CodingCallBack)();

@interface TLPeople (Associated)

@property (nonatomic, strong) NSNumber *associatedBust; // 胸围
@property (nonatomic, copy) CodingCallBack associatedCallBack;  // 写代码

@end
