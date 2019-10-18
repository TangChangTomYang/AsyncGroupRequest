//
//  GHAsyncResponse.m
//  AsyncGroupRequest
//
//  Created by yangrui on 2019/10/18.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "GHAsyncResponse.h"

@implementation GHAsyncResponse

+(instancetype)withSuccessResponse:(NSObject *)successResponse errorResponse:(NSObject *)errorResponse{
    GHAsyncResponse *mode = [[self alloc]init];
    mode.successResponse = successResponse ;
    mode.errorResponse = errorResponse ;
    return mode;
}


+(instancetype)withSuccessResponse:(NSObject *)successResponse{
    return  [self withSuccessResponse:successResponse errorResponse:nil];
}
+(instancetype)withErrorResponse:(NSObject *)errorResponse{
    return  [self withSuccessResponse:nil errorResponse:errorResponse];
}
@end
