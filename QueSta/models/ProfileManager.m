//
//  ProfileManager.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/11.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "ProfileManager.h"

@implementation ProfileManager

@synthesize profileArray = _profileArray;

static ProfileManager *_sharedInstance = nil;

+ (ProfileManager *)sharedManager
{
    if (!_sharedInstance) {
        _sharedInstance = [[ProfileManager alloc] init];
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

- (void)updateProfileArray:(Profile *)profile
{
    _profileArray = [[NSMutableArray alloc] init];
    [_profileArray addObject:profile];
}

@end
