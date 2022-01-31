//
//  RCTTerra.m
//  RCTTerra
//
//  Created by Jaafar Rammal on 03/01/2022.
//

#import "React/RCTBridgeModule.h"
@interface RCT_EXTERN_REMAP_MODULE(RNTerraApple, TerraSwiftBridge, NSObject)

// auth
RCT_EXTERN_METHOD(
    auth:
    (NSString *)devID
    apiKey: (NSString *)apiKey
    referenceID: (NSString *)referenceID
    resolve: (RCTPromiseResolveBlock)resolve
    rejecter: (RCTPromiseRejectBlock)reject
)
RCT_EXTERN_METHOD(deauth)


// init
RCT_EXTERN_METHOD(
    initTerra:
    (NSString *)devID
    apiKey: (NSString *)apiKey
    autoFetch: (BOOL *)autoFetch
)

// getters
RCT_EXTERN_METHOD(getAthlete)
RCT_EXTERN_METHOD(getBody: (NSDate *)startDate endDate:(NSDate *)endDate)
RCT_EXTERN_METHOD(getDaily: (NSDate *)startDate endDate:(NSDate *)endDate)
RCT_EXTERN_METHOD(getSleep: (NSDate *)startDate endDate:(NSDate *)endDate)
RCT_EXTERN_METHOD(getActivity: (NSDate *)startDate endDate:(NSDate *)endDate)

@end

