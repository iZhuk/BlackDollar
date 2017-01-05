//
//  CurrencyModel.h
//  BlackDollar
//
//  Created by Eugene Zhuk Home on 1/3/17.
//  Copyright © 2017 Eugene Zhuk. All rights reserved.
//

#import "BaseModel.h"

@interface CurrencyModel : BaseModel
@property (readonly) NSString *id;
@property (readonly) NSString *code;
@property (readonly) NSString *title;
@property (readonly) NSString *verbal;
@property (readonly) NSString *symbol;
@end
