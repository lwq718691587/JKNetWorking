//
//  BGNetworkConfiguration.m
//  BGNetwork
//
//  Created by user on 15/8/18.
//  Copyright © 2015年 BGNetwork https://github.com/liuchungui/BGNetwork/tree/dev. All rights reserved.
//

#import "BGNetworkConfiguration.h"
#import "BGUtilFunction.h"

@interface BGNetworkConfiguration ()
@property(nonatomic, strong) NSString *baseURLString;

@end

@implementation BGNetworkConfiguration

+ (instancetype)configuration{
    return [self configurationWithBaseURL: @"http://api.izhangchu.com:/"];
}

+ (instancetype _Nonnull)configurationWithBaseURL:(NSString *)baseURL {
    BGNetworkConfiguration *configuration = [[self alloc] init];
    configuration.baseURLString = baseURL;
    return configuration;
}

#pragma mark - BGNetworkConfiguration
- (NSString *)baseURLString {
    return _baseURLString;
}

- (BOOL)checkProxy {
    return NO;
}

- (void)handleProxy {
    
}

- (void)preProcessingRequest:(BGNetworkRequest *)request {
}

-(NSMutableDictionary *)headerDic{
    return [@{@"User-Agent":@"iPhone"} mutableCopy];
}

- (NSDictionary *)requestHTTPHeaderFields:(BGNetworkRequest *)request {
    NSMutableDictionary *allHTTPHeaderFileds = [self headerDic];
    if (request.isJsonParamType) {
        [allHTTPHeaderFileds setValue:@"application/json" forKey:@"Content-Type"];
    }else{
        [allHTTPHeaderFileds setValue:@"application/x-www-form-urlencoded" forKey:@"Content-Type"];
    }
    [request.requestHTTPHeaderFields enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        allHTTPHeaderFileds[key] = obj;
    }];
    return allHTTPHeaderFileds;
}

- (NSString *)queryStringForURLWithRequest:(BGNetworkRequest *)request{
    if(request.httpMethod == BGNetworkRequestHTTPGet){
        NSString *paramString = BGQueryStringFromParamDictionary(request.parametersDic);
        return [NSString stringWithFormat:@"%@", paramString];
    }else{
        return nil;
    }
}

- (NSData *)httpBodyDataWithRequest:(BGNetworkRequest *)request{
    if(request.httpMethod == BGNetworkRequestHTTPGet || (!request.parametersDic.count && !request.parametersArr.count)){
        return nil;
    }
    NSData *httpBody;
    if (request.isJsonParamType) {
        NSError *error = nil;
        
        httpBody = [NSJSONSerialization dataWithJSONObject:request.parametersArr.count > 0?request.parametersArr:request.parametersDic options: (NSJSONWritingOptions)0 error:&error];
        if(error){
            return nil;
        }
    }else{
        NSString * __block finalStr = @"";
        [request.parametersDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSString * perStr = [NSString stringWithFormat:@"&%@=%@",key,obj];
            finalStr = [finalStr stringByAppendingString:perStr];
        }];
        if (finalStr.length > 1) {
            httpBody = [[finalStr substringFromIndex:1] dataUsingEncoding:NSUTF8StringEncoding];
        }else{
            return nil;
        }
    }
    return httpBody;
}

- (NSData *)decryptResponseData:(NSData *)responseData response:(NSURLResponse *)response request:(BGNetworkRequest *)request{
    return responseData;
}

- (BOOL)shouldCacheResponseData:(id)responseData task:(NSURLSessionDataTask *)task request:(BGNetworkRequest *)request{
    if(request.cachePolicy == BGNetworkRequestCacheDataAndReadCacheOnly || request.cachePolicy == BGNetworkRequestCacheDataAndReadCacheLoadData) {
        return YES;
    }
    return NO;
}

- (BOOL)shouldBusinessSuccessWithResponseData:(id)responseData task:(NSURLSessionDataTask *)task request:(BGNetworkRequest *)request {
    return YES;
}

@end
