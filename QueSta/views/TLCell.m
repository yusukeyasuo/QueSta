//
//  TLCell.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/10.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "TLCell.h"

@implementation TLCell

@synthesize profileImageView = _profileImageView;
@synthesize containerView = _containerView;
@synthesize nameLabel = _nameLabel;
@synthesize minutesLabel = _minutesLabel;
@synthesize datetimeLabel = _datetimeLabel;
@synthesize moneyLabel = _moneyLabel;

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
