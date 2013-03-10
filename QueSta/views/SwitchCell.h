//
//  SwitchCell.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/10.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchCell : UITableViewCell
{
    IBOutlet UISegmentedControl *_segmentedControl;
}

@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end
