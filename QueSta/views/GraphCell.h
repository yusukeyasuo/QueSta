//
//  GraphCell.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphCell : UITableViewCell
{
    IBOutlet UIView *_graphBackgroundView;
    IBOutlet UIView *_graphView;
    IBOutlet UIView *_containerView;
}

@property (nonatomic, strong) UIView *graphBackgroundView;
@property (nonatomic, strong) UIView *graphView;
@property (nonatomic, strong) UIView *containerView;

@end
