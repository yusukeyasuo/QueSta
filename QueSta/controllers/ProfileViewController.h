//
//  ProfileViewController.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Profile.h"
#import "Status.h"

@interface ProfileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *_tableView;
    
    NSInteger _segmentedControlStatus;
    Profile *_profile;
    Status *_status;
}

@end
