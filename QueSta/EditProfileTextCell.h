//
//  EditProfileTextCell.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/10.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileTextCell : UITableViewCell
{
    IBOutlet UILabel *_label;
    IBOutlet UITextField *_textField;
}

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;

@end
