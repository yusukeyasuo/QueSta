//
//  StatusManager.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/11.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "StatusManager.h"

@implementation StatusManager

@synthesize statusArray = _statusArray;

static StatusManager *_sharedInstance = nil;

+ (StatusManager *)sharedManager
{
    if (!_sharedInstance) {
        _sharedInstance = [[StatusManager alloc] init];
    }
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

- (void)updateStatus:(Status *)status
{
    _statusArray = [[NSMutableArray alloc] init];
    [_statusArray addObject:status];
}

@end
