//
//  TLManager.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/31.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TL.h"

@interface TLManager : NSObject
{
    NSMutableArray *_tlArray;
    
    NSArray *_tlArray_paths;
    NSString *_tlArray_directory;
    NSString *_tlArray_filePath;

}

@property (nonatomic, readonly) NSArray *tlArray;

+ (TLManager *)sharedManager;
- (void)updateTL:(TL *)tl;
- (void)saveTL;
- (void)loadTL;

@end
