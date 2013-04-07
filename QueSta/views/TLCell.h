//
//  TLCell.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/10.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLCell : UITableViewCell
{
    IBOutlet UIImageView *_profileImageView;
    IBOutlet UIView *_containerView;
    IBOutlet UILabel *_nameLabel;
    IBOutlet UILabel *_goalLabel;
    IBOutlet UILabel *_minutesLabel;
    IBOutlet UILabel *_datetimeLabel;
    IBOutlet UILabel *_moneyLabel;
}

@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *goalLabel;
@property (nonatomic, strong) UILabel *minutesLabel;
@property (nonatomic, strong) UILabel *datetimeLabel;
@property (nonatomic, strong) UILabel *moneyLabel;

@end
