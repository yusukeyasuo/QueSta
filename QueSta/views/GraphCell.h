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
    IBOutlet UIView *_containerView;
    IBOutlet UILabel *_studyMinutes;
    IBOutlet UILabel *_shortMinutes;
    IBOutlet UILabel *_expense;
}

@property (nonatomic, strong) UIView *graphBackgroundView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *studyMinutes;
@property (nonatomic, strong) UILabel *shortMinutes;
@property (nonatomic, strong) UILabel *expense;

@end
