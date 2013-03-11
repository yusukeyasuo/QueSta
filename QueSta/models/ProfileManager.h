//
//  ProfileManager.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/11.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"

@interface ProfileManager : NSObject
{
    NSMutableArray *_profileArray;
}

@property (nonatomic, readonly) NSArray *profileArray;

+ (ProfileManager *)sharedManager;
- (void)updateProfileArray:(Profile *)profile;

@end
