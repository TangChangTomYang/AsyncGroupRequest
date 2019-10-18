//
//  GHAsyncResponse.h
//  AsyncGroupRequest
//
//  Created by yangrui on 2019/10/18.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GHAsyncResponse : NSObject
@property (strong, nonatomic) NSObject *successResponse;
@property (strong, nonatomic) NSObject *errorResponse;

+(instancetype)withSuccessResponse:(NSObject *)successResponse;
+(instancetype)withErrorResponse:(NSObject *)errorResponse;
@end


