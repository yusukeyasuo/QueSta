//
//  EditProfileImageCell.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/10.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileImageCell : UITableViewCell
{
    IBOutlet UIImageView *_profileImage;
}

@property (nonatomic, strong) UIImageView *profileImage;

@end
