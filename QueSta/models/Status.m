//
//  Status.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/11.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "Status.h"

@implementation Status

@synthesize studyMinutesAll = _studyMinutesAll;
@synthesize studyMinutes = _studyMinutes;
@synthesize level = _level;
@synthesize expense = _expense;

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder*)decoder
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _studyMinutesAll = [decoder decodeIntegerForKey:@"studyMinutesAll"];
    _studyMinutes = [decoder decodeIntegerForKey:@"studyMinutes"];
    _level = [decoder decodeIntegerForKey:@"level"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeInteger:_studyMinutesAll forKey:@"studyMinutesAll"];
    [encoder encodeInteger:_studyMinutes forKey:@"studyMinutes"];
    [encoder encodeInteger:_level forKey:@"level"];
}


@end
