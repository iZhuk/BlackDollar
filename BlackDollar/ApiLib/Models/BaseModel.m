//
//  BaseModel.m
//  BlackDollar
//
//  Created by Eugene Zhuk Home on 1/3/17.
//  Copyright © 2017 Eugene Zhuk. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _response = dictionary;
        [self parse];
    }
    return self;
}

- (void)parse {
}
@end
