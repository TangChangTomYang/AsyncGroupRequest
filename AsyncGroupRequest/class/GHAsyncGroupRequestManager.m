

//
//  GHAsyncGroupRequestManager.m
//  AsyncGroupRequest
//
//  Created by yangrui on 2019/10/18.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "GHAsyncGroupRequestManager.h"
@interface GHAsyncGroupRequestManager ()
@property (strong, nonatomic) NSMutableArray<GHAsyncGroupRequest *> *groupRequestArrM;
@end
@implementation GHAsyncGroupRequestManager
-(NSMutableArray<GHAsyncGroupRequest *> *)groupRequestArrM{
    if (!_groupRequestArrM) {
        _groupRequestArrM = @[].mutableCopy;
    }
    return _groupRequestArrM;
}

-(void)sendRequests:(NSArray *)requests  callback:(AsyncGroupRequestCallback)callback{
    GHAsyncGroupRequest *groupRequest = [GHAsyncGroupRequest new];
    [self.groupRequestArrM addObject:groupRequest];
    __weak typeof(self) weakSelf = self;
    __weak typeof(groupRequest) weakGroupRequest = groupRequest;
    [groupRequest sendRequests:requests callback:^(NSMutableArray<GHAsyncResponse *> *responseArrM) {
         callback(responseArrM);
         [weakSelf.groupRequestArrM removeObject:weakGroupRequest];
    }];
}
@end
