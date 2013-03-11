//
//  EditProfileViewController.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/10.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Profile.h"
#import "Status.h"

@interface EditProfileViewController : UITableViewController <UIActionSheetDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate, UITextFieldDelegate>
{
    UIActionSheet *_actionSheet;
    UIImagePickerController *_imagePickerController;
    UIImage *_profileImage;
    
    NSArray *_actionSheetItems;
    NSString *_name;
    NSString *_goal;
    
    Profile *_profile;
    Status *_status;
}

- (IBAction)saveButtonPressed:(id)sender;

@end
