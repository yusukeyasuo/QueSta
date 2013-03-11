//
//  StatusManager.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/11.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Status.h"

@interface StatusManager : NSObject
{
    NSMutableArray *_statusArray;
}

@property (nonatomic, readonly) NSArray *statusArray;

+ (StatusManager *)sharedManager;
- (void)updateStatus:(Status *)status;

@end
