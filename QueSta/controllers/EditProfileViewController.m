//
//  EditProfileViewController.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/10.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "EditProfileViewController.h"
#import "EditProfileImageCell.h"
#import "EditProfileTextCell.h"
#import "ProfileManager.h"
#import "StatusManager.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_background.png"]];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_background.png"]];
    
    _actionSheetItems = @[@"写真を撮る", @"ライブラリから選択"];
    _actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    for (NSString *title in _actionSheetItems)
    {
        [_actionSheet addButtonWithTitle:title];
    }
    _actionSheet.cancelButtonIndex = [_actionSheet addButtonWithTitle:@"キャンセル"];
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.delegate = self;
    
    _profile = [ProfileManager sharedManager].profileArray[0];
    _status = [StatusManager sharedManager].statusArray[0];
    
    _profileImage = _profile.profileImage;
    _name = _profile.name;
    _goal = _profile.goal;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)saveButtonPressed:(id)sender
{
    Profile *profile = [[Profile alloc] init];
    profile.name = _name;
    profile.goal = _goal;
    profile.profileImage = _profileImage;
    [[ProfileManager sharedManager] updateProfileArray:profile];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0]animated:YES];
}

#pragma mark - Action Sheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerControllerSourceType sourceType = 0;
    switch (buttonIndex) {
        case 0:     // take picture
            sourceType = UIImagePickerControllerSourceTypeCamera;
            if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
                return;
            }
            
            _imagePickerController.sourceType = sourceType;
            _imagePickerController.allowsEditing = YES;
            
            [self presentViewController:_imagePickerController animated:YES completion:nil];
            break;
            
        case 1:    // select from library
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
                return;
            }
            
            _imagePickerController.sourceType = sourceType;
            _imagePickerController.allowsEditing = YES;
            
            [self presentViewController:_imagePickerController animated:YES completion:nil];
            break;
        default:
            return;
    }
}

#pragma mark - Picker view delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"selected");
    _profileImage = [info objectForKey:UIImagePickerControllerEditedImage];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

#pragma mark - TextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    switch (textField.tag) {
        case 1:
            _name = textField.text;
            break;
            
        case 2:
            _goal = textField.text;
            break;
            
        default:
            break;
    }
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 55;
    } else {
        return 44;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 10;
            break;
        default:
            return 0.1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"ImageCell";
        EditProfileImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1]; // #EEEEEE
        
        [cell.profileImage setImage:_profileImage];

        return cell;
    } else if (indexPath.section == 1) {
        static NSString *CellIdentifier = @"TextCell";
        EditProfileTextCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1]; // #EEEEEE
        
        cell.label.text = @"名前";
        cell.textField.text = _profile.name;
        cell.textField.tag = 1;
        
        return cell;
    } else {
        static NSString *CellIdentifier = @"TextCell";
        EditProfileTextCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1]; // #EEEEEE
        
        cell.label.text = @"目標";
        cell.textField.text = _profile.goal;
        cell.textField.tag = 2;
        
        return cell;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        [_actionSheet showInView:[self.view window]];
    }
}

@end
