//
//  GraphCell.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "GraphCell.h"

@implementation GraphCell

@synthesize graphBackgroundView = _graphBackgroundView;
@synthesize graphView = _graphView;
@synthesize containerView = _containerView;
@synthesize studyMinutes = _studyMinutes;
@synthesize shortMinutes = _shortMinutes;
@synthesize expense = _expense;

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
