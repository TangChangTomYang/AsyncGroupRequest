

//
//  GHAsyncGroupRequest.m
//  AsyncGroupRequest
//
//  Created by yangrui on 2019/10/18.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "GHAsyncGroupRequest.h"
@interface GHAsyncGroupRequest()
@property (strong, nonatomic) NSMutableArray<GHAsyncResponse *> *responseArrM;

@end
@implementation GHAsyncGroupRequest
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"sheng");
    }
    return self;
}- (NSMutableArray<GHAsyncResponse *> *)responseArrM{
    if (!_responseArrM) {
        _responseArrM = @[].mutableCopy;
    }
    return _responseArrM;
}

-(void)sendRequests:(NSArray *)requests callback:(AsyncGroupRequestCallback)callback{
    dispatch_group_t group = dispatch_group_create();
    self.callback = callback;
    __weak typeof(self)  weakSelf = self;
    
    for (int i = 0 ; i <requests.count ; i++) {
        dispatch_group_enter(group);
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@" 执行请求: ----%d",i);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@" ====响应请求: ===%d",i);
                
                [weakSelf.responseArrM addObject:[GHAsyncResponse withSuccessResponse:[NSString stringWithFormat:@"请求: %i 的响应", i]]];
                dispatch_group_leave(group);
            });
        });
    }
     
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //界面刷新
        NSLog(@"----所有请求完成");
        weakSelf.callback(weakSelf.responseArrM);
        
    });
}

-(void)dealloc{
    NSLog(@"si");
}
@end
