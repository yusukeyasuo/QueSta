//
//  EditProfileViewController.h
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/10.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UITableViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate>
{
    UIActionSheet *_actionSheet;
    UIImagePickerController *_imagePickerController;
    
    NSArray *_actionSheetItems;
}

@end
