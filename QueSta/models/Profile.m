//
//  Profile.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/11.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "Profile.h"

@implementation Profile

@synthesize profileImage = _profileImage;
@synthesize name = _name;
@synthesize goal = _goal;

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
    
    _profileImage = [decoder decodeObjectForKey:@"profileImage"];
    _name = [decoder decodeObjectForKey:@"name"];
    _goal = [decoder decodeObjectForKey:@"goal"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:_profileImage forKey:@"profileImage"];
    [encoder encodeObject:_name forKey:@"name"];
    [encoder encodeObject:_goal forKey:@"goal"];
}



@end
