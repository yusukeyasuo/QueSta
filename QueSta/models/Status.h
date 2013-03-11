//
//  Status.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/11.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject
{
    NSInteger _studyMinutesAll;
    NSInteger _studyMinutes;
    NSInteger _level;
    NSInteger _expense;
}

@property (nonatomic) NSInteger studyMinutesAll;
@property (nonatomic) NSInteger studyMinutes;
@property (nonatomic) NSInteger level;
@property (nonatomic) NSInteger expense;

@end
