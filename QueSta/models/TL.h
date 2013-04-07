//
//  TL.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/31.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TL : NSObject
{
    NSInteger _studyMinutes;
    NSInteger _expense;
    NSString *_comment;
    NSDate *_created;
}

@property (nonatomic) NSInteger studyMinutes;
@property (nonatomic) NSInteger expense;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSDate *created;

@end
