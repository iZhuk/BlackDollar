//
//  NSArray+Mapping.m
//  BlackDollar
//
//  Created by Eugene Zhuk Home on 1/3/17.
//  Copyright © 2017 Eugene Zhuk. All rights reserved.
//

#import "NSArray+Mapping.h"

@implementation NSArray (Mapping)
- (NSArray *)map:(id (^)(id original))map {
    NSMutableArray *array = [NSMutableArray new];
    for (id object in self) {
        [array addObject:map(object)];
    }
    return array.copy;
}
@end
