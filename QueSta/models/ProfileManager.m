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
    [self saveProfile];
}

- (void)saveProfile
{
    NSLog(@"saveProfile");
    _profileArray_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _profileArray_directory = [_profileArray_paths objectAtIndex:0];
    _profileArray_filePath = [_profileArray_directory stringByAppendingPathComponent:@"profileArray_data.dat"];
    [NSKeyedArchiver archiveRootObject:_profileArray toFile:_profileArray_filePath];
}

- (void)loadProfile
{
    NSLog(@"loadProfile");
    _profileArray_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _profileArray_directory = [_profileArray_paths objectAtIndex:0];
    _profileArray_filePath = [_profileArray_directory stringByAppendingPathComponent:@"profileArray_data.dat"];
    _profileArray = [NSKeyedUnarchiver unarchiveObjectWithFile:_profileArray_filePath];
}

@end
