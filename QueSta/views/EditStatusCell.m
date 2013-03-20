//
//  EditStatusCell.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/20.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "EditStatusCell.h"

@implementation EditStatusCell

@synthesize containerView = _containerView;
@synthesize containerView2 = _containerView2;
@synthesize containerView3 = _containerView3;

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
