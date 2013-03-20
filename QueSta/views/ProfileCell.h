//
//  ProfileCell.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileCell : UITableViewCell
{
    IBOutlet UIImageView *_profileImageView;
    IBOutlet UIImageView *_badgeImageView;
    IBOutlet UILabel *_nameLabel;
    IBOutlet UILabel *_goalLabel;
    IBOutlet UILabel *_levelLabel;
    IBOutlet UILabel *_pointLabel;
    IBOutlet UIProgressView *_progressView;
}

@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UIImageView *badgeImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *goalLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UILabel *pointLabel;
@property (nonatomic, strong) UIProgressView *progressView;

@end
