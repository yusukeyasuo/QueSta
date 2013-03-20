//
//  EditStatusCell.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/20.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditStatusCell : UITableViewCell
{
    IBOutlet UIView *_containerView;
    IBOutlet UIView *_containerView2;
    IBOutlet UIView *_containerView3;
}

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *containerView2;
@property (nonatomic, strong) UIView *containerView3;

@end
