//
//  TLManager.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/31.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "TLManager.h"

@implementation TLManager

@synthesize tlArray = _tlArray;

static TLManager *_sharedInstance = nil;

+ (TLManager *)sharedManager
{
    if (!_sharedInstance) {
        _sharedInstance = [[TLManager alloc] init];
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

- (void)updateTL:(TL *)tl
{
    if (!_tlArray) {
        _tlArray = [[NSMutableArray alloc] init];
    }
    [_tlArray insertObject:tl atIndex:0];
}

- (void)saveTL
{
    NSLog(@"saveTL");
    _tlArray_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _tlArray_directory = [_tlArray_paths objectAtIndex:0];
    _tlArray_filePath = [_tlArray_directory stringByAppendingPathComponent:@"tlArray_data.dat"];
    [NSKeyedArchiver archiveRootObject:_tlArray toFile:_tlArray_filePath];
}

- (void)loadTL
{
    NSLog(@"loadTL");
    _tlArray_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _tlArray_directory = [_tlArray_paths objectAtIndex:0];
    _tlArray_filePath = [_tlArray_directory stringByAppendingPathComponent:@"tlArray_data.dat"];
    _tlArray = [NSKeyedUnarchiver unarchiveObjectWithFile:_tlArray_filePath];
}

@end
