//
//  LabelCell.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/20.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "LabelCell.h"

@implementation LabelCell
@synthesize checkinCount = _checkinCount;

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
