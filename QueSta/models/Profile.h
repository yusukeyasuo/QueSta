//
//  Profile.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/11.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject
{
    UIImage *_profileImage;
    NSString *_name;
    NSString *_goal;
}

@property (nonatomic, strong) UIImage *profileImage;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *goal;

@end
