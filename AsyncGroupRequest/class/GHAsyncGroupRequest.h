//
//  GHAsyncGroupRequest.h
//  AsyncGroupRequest
//
//  Created by yangrui on 2019/10/18.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHAsyncResponse.h"
typedef void(^AsyncGroupRequestCallback)(NSMutableArray<GHAsyncResponse *> * responseArrM) ;


@interface GHAsyncGroupRequest : NSObject
@property (copy, nonatomic) AsyncGroupRequestCallback callback;

-(void)sendRequests:(NSArray *)requests callback:(AsyncGroupRequestCallback)callback;
@end

