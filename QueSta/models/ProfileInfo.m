//
//  ProfileInfo.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "ProfileInfo.h"

@implementation ProfileInfo
@synthesize name = _name;

static ProfileInfo *_sharedInstance = nil;

+ (ProfileInfo *)sharedManager
{
    if (!_sharedInstance) {
        _sharedInstance = [[ProfileInfo alloc] init];
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

@end
