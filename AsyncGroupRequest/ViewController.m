//
//  ViewController.m
//  AsyncGroupRequest
//
//  Created by yangrui on 2019/10/17.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "ViewController.h"
#import "GHAsyncGroupRequestManager.h"

@interface ViewController ()
@property (strong, nonatomic) GHAsyncGroupRequestManager *mgr;
@end

@implementation ViewController


-(GHAsyncGroupRequestManager *)mgr{
    if (!_mgr) {
        _mgr = [GHAsyncGroupRequestManager new];
    }
    return _mgr;
}
int i = 0;
- (IBAction)send:(id)sender {
    [self.mgr sendRequests:@[@(1),@(2),@(3),@(4),@(5)] callback:^(NSMutableArray<GHAsyncResponse *> *responseArrM) {
         NSLog(@"%@",responseArrM );
    } ];
}
 

@end
