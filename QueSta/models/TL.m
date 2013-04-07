//
//  TL.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/31.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "TL.h"

@implementation TL

@synthesize studyMinutes = _studyMinutes;
@synthesize expense = _expense;
@synthesize comment = _comment;
@synthesize created = _created;

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
    
    _studyMinutes = [decoder decodeIntegerForKey:@"studyMinutes"];
    _expense = [decoder decodeIntegerForKey:@"expense"];
    _comment = [decoder decodeObjectForKey:@"comment"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeInteger:_studyMinutes forKey:@"studyMinutes"];
    [encoder encodeInteger:_expense forKey:@"expense"];
    [encoder encodeObject:_comment forKey:@"comment"];
}

@end

