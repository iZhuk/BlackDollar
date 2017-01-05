//
//  NSArray+Mapping.h
//  BlackDollar
//
//  Created by Eugene Zhuk Home on 1/3/17.
//  Copyright © 2017 Eugene Zhuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Mapping)
- (NSArray *)map:(id (^)(id original))map;
@end
