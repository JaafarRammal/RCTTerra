//
//  RCTTerra.m
//  RCTTerra
//
//  Created by Jaafar Rammal on 03/01/2022.
//

#import "React/RCTBridgeModule.h"
@interface RCT_EXTERN_REMAP_MODULE(RNTerra, TerraSwiftBridge, NSObject)

RCT_EXTERN_METHOD(initApple: (NSString *)devID apiKey: (NSString *)apiKey autoFetch: (BOOL *)autoFetch referenceID: (NSString *)referenceID callback: (RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(deauth)
RCT_EXTERN_METHOD(getAthlete)
RCT_EXTERN_METHOD(getBody: (NSDate *)startDate endDate:(NSDate *)endDate)
RCT_EXTERN_METHOD(getDaily: (NSDate *)startDate endDate:(NSDate *)endDate)
RCT_EXTERN_METHOD(getSleep: (NSDate *)startDate endDate:(NSDate *)endDate)
RCT_EXTERN_METHOD(getActivity: (NSDate *)startDate endDate:(NSDate *)endDate)

@end

