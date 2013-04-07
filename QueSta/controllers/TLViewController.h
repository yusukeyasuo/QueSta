//
//  TLViewController.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Profile.h"

@interface TLViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    IBOutlet UITableView *_tableView;
    UIPickerView *_pickerView;
    
    CGRect _screenRect;
    NSString *_studyMinutes;
    NSInteger _hour;
    NSInteger _minutes;
    NSInteger _expense;
    NSString *_comment;
    NSMutableArray *_tlArray;
    Profile *_profile;
}

@end
