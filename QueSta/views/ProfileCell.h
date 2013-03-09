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
}

@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UIImageView *badgeImageView;

@end
