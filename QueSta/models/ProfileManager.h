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
    NSArray *_dummyArray;
    
    NSArray *_profileArray_paths;
    NSString *_profileArray_directory;
    NSString *_profileArray_filePath;
}

@property (nonatomic, readonly) NSArray *profileArray;

+ (ProfileManager *)sharedManager;
- (void)updateProfileArray:(Profile *)profile;
- (void)saveProfile;
- (void)loadProfile;

@end
