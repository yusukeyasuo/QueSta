//
//  LabelCell.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/20.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelCell : UITableViewCell
{
    UILabel *_checkinCount;
}

@property (nonatomic, strong) UILabel *checkinCount;

@end
