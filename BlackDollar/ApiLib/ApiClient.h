//
//  ApiClient.h
//  BlackDollar
//
//  Created by Eugene Zhuk Home on 1/3/17.
//  Copyright © 2017 Eugene Zhuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiClient : NSObject
- (void)getCurrenciesWithCompletion:(void (^)(NSArray *currencies, NSError *error))completionHandler;
- (void)getAveragesWithCompletion:(void (^)(NSArray *currencies, NSError *error))completionHandler;
@end
