//
//  ApiClient.m
//  BlackDollar
//
//  Created by Eugene Zhuk Home on 1/3/17.
//  Copyright © 2017 Eugene Zhuk. All rights reserved.
//

#import "ApiClient.h"
#import "NSArray+Mapping.h"

const NSString *domain = @"https://hryvna-today.p.mashape.com/";
const NSString *apiKey = @"2SzC5G9HmJmshiLM19AkBE6zW8khp1v5M5bjsncF5c3NKOy8Jo";
const NSString *apiVersion = @"v1";


const NSString *getCurrenciesPath = @"/list/currencies";
const NSString *getAveragesPath = @"/rates/averages";
const NSString *getRatesTodayPath = @"/rates/today";

@implementation ApiClient
- (void)getAveragesWithCompletion:(void (^)(NSArray *averages, NSError *error))completionHandler {
    [self performRequestWithApiPath:getAveragesPath parameters:nil withComplition:^(NSDictionary *response, NSError *error) {
        
    }];
}

- (void)getRatesTodayWithCompletion:(void (^)(NSArray *rates, NSError *error))completionHandler {
    [self performRequestWithApiPath:getRatesTodayPath parameters:nil withComplition:^(NSDictionary *response, NSError *error) {
        if (completionHandler) {
            if (!error) {
                completionHandler(response, nil);
            } else {
                completionHandler(nil, error);
            }
        }
    }];
}

- (void)getCurrenciesWithCompletion:(void (^)(NSArray <CurrencyModel *> *currencies, NSError *error))completionHandler {
    [self performRequestWithApiPath:getCurrenciesPath parameters:nil withComplition:^(NSDictionary *response, NSError *error) {
        if (completionHandler) {
            if (!error) {                
                NSArray *currencies = response[@"data"];
                completionHandler([currencies map:^id(id original) { return [[CurrencyModel alloc] initWithDictionary:original]; }], nil);
            } else {
                completionHandler(nil, error);
            }
        }
    }];
}

- (void)performRequestWithApiPath:(const NSString *)apiPath parameters:(NSDictionary *)params withComplition:(void (^)(NSDictionary *response, NSError *error))completionHandler {
    NSString *urlPath = [NSString stringWithFormat:@"%@/%@%@", domain, apiVersion, apiPath];
    NSURL *url = [NSURL URLWithString:urlPath];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setAllHTTPHeaderFields:@{
                                      @"X-Mashape-Key" : apiKey,
                                      @"Accept" : @"application/json",
                                      }];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSError *parsingError = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parsingError];
            completionHandler(dict, parsingError);
        } else {
            completionHandler(nil, error);
        }
        
    }] resume];
}
@end
