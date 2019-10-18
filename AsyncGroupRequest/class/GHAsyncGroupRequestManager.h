//
//  GHAsyncGroupRequestManager.h
//  AsyncGroupRequest
//
//  Created by yangrui on 2019/10/18.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GHAsyncGroupRequest.h"

@interface GHAsyncGroupRequestManager : NSObject
-(void)sendRequests:(NSArray *)requests  callback:(AsyncGroupRequestCallback)callback;
@end 
