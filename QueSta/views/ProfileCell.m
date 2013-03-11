//
//  ProfileCell.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "ProfileCell.h"

@implementation ProfileCell

@synthesize profileImageView = _profileImageView;
@synthesize badgeImageView = _badgeImageView;
@synthesize nameLabel = _nameLabel;
@synthesize goalLabel = _goalLabel;
@synthesize levelLabel = _levelLabel;
@synthesize pointLabel = _pointLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
