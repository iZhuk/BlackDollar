//
//  CurrencyModel.m
//  BlackDollar
//
//  Created by Eugene Zhuk Home on 1/3/17.
//  Copyright © 2017 Eugene Zhuk. All rights reserved.
//

#import "CurrencyModel.h"

@implementation CurrencyModel
- (void)parse {
    _id = [_response[@"id"] stringValue];
    _code = _response[@"code"];
    _title = _response[@"title"];
    _verbal = _response[@"verbal"];
    _symbol = _response[@"symbol"];
}
@end
