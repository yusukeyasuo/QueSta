//
//  TLViewController.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "TLViewController.h"
#import "TLCell.h"
#import "LabelCell.h"
#import "EditStatusCell.h"
#import "TLManager.h"
#import "TL.h"
#import "ProfileManager.h"

@interface TLViewController ()

@end

@implementation TLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"black_background.png"]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_background.png"] forBarMetrics:UIBarMetricsDefault];
    //self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.196 green:0.388 blue:0.545 alpha:1]; /*#32638b*/
    _tableView.backgroundColor = [UIColor clearColor];
    
    _screenRect = [[UIScreen mainScreen] bounds];
    
    _hour = 0;
    _minutes = 0;
    _expense = 0;
    _comment = [[NSString alloc] init];
    
    _tlArray = (NSMutableArray *)[TLManager sharedManager].tlArray;
    _profile = [ProfileManager sharedManager].profileArray[0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPicker:(UITextField *)textField
{
    _pickerView = [[UIPickerView alloc] init];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    _pickerView.showsSelectionIndicator = YES;
    textField.inputView = _pickerView;
}

- (void)donePressed:(id)sender
{
    [_tableView reloadData];
    [self.view endEditing: YES];
}

#pragma mark - IBAction

- (IBAction)pressCheckIn:(id)sender
{
    NSLog(@"Check In!");
    [_tableView reloadData];
    if (!_hour && !_minutes) {
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:@"学習時間が未入力です"
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else {
        TL *tl = [[TL alloc] init];
        tl.studyMinutes = _hour * 60 + _minutes;
        tl.expense = _expense;
        tl.comment = _comment;
        tl.created = [NSDate date];
        [[TLManager sharedManager] updateTL:tl];
        _tlArray = (NSMutableArray *)[TLManager sharedManager].tlArray;
        
        _hour = 0;
        _minutes = 0;
        _expense = 0;
        _comment = [[NSString alloc] init];
        [_tableView reloadData];
        
        [[[UIAlertView alloc] initWithTitle:nil
                                    message:@"チェックインしました"
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0, _screenRect.size.width, 44)];
    toolbar.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(donePressed:)];
    doneButton.tintColor = [UIColor blackColor];
    [toolbar setItems:[NSArray arrayWithObject: doneButton] animated:NO];
    textField.inputAccessoryView = toolbar;
    
    if (textField.tag == 0) {
        [self showPicker:textField];
        return YES;
    }
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField*)textField
{
    switch (textField.tag) {
        case 0:
            _hour = [_pickerView selectedRowInComponent:0];
            _minutes = [_pickerView selectedRowInComponent:1];
            break;
        case 1:
            _expense = [textField.text intValue];
            break;
            
        case 2:
            _comment = textField.text;
            break;
            
        default:
            break;
            
    }
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Picker view data source

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if(component == 0) {
        return 24;
    } else {
        return 60;
    }
    
}

-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [NSString stringWithFormat:@"%d時間", row];
    } else {
        return [NSString stringWithFormat:@"%d分", row];
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            return 1;
            break;
            
        default:
            return [TLManager sharedManager].tlArray.count;
            break;
    }
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 214;
            break;
            
        case 1:
            return 33;
            break;
            
        default:
            return 100;
            break;
    }
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return @"投稿";
            break;
            
        default:
            return @"最近の活動";
            break;
    }
}
*/

// Change UITableViewCell.backgroundColor
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_background.png"]];
            break;
            
        case 1:
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_background.png"]];
            break;
            
        default:
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_background.png"]];
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *CellIdentifier = @"EditStatusCell";
        EditStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        //cell.containerView.layer.cornerRadius = 8.0f;
        //cell.containerView.clipsToBounds = YES;
        
        cell.containerView.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
        cell.containerView.layer.shadowOpacity = 0.2f;
        cell.containerView.layer.shadowOffset = CGSizeMake(0, 2.0f);
        
        cell.containerView2.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
        cell.containerView2.layer.shadowOpacity = 0.2f;
        cell.containerView2.layer.shadowOffset = CGSizeMake(0, 2.0f);
        
        cell.containerView3.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
        cell.containerView3.layer.shadowOpacity = 0.2f;
        cell.containerView3.layer.shadowOffset = CGSizeMake(0, 2.0f);
        
        cell.timeTF.tag = 0;
        cell.moneyTF.tag = 1;
        cell.commentTF.tag = 2;
        
        if (_hour) {
            cell.timeTF.text = [NSString stringWithFormat:@"%d時間%d分", _hour, _minutes];
        } else if (_minutes) {
            cell.timeTF.text = [NSString stringWithFormat:@"%d分", _minutes];
        }
        
        if (_expense) {
            cell.moneyTF.text = [NSString stringWithFormat:@"%d", _expense];
        }
        
        if (_comment) {
            cell.commentTF.text = _comment;
        }
        
        return cell;
        
    } else if (indexPath.section == 1) {
        static NSString *CellIdentifier = @"LabelCell";
        LabelCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        return cell;
        
    } else {
        TL *tl = _tlArray[indexPath.row];
        
        static NSString *CellIdentifier = @"Cell";
        TLCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

        cell.profileImageView.layer.cornerRadius = 8.0f;
        cell.profileImageView.clipsToBounds = YES;
        
        cell.containerView.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
        cell.containerView.layer.shadowOpacity = 0.2f;
        cell.containerView.layer.shadowOffset = CGSizeMake(0, 2.0f);
        
        cell.profileImageView.image = _profile.profileImage;
        cell.nameLabel.text = _profile.name;
        cell.goalLabel.text = _profile.goal;
        
        if (tl.studyMinutes < 60) {
            cell.minutesLabel.text = [NSString stringWithFormat:@"%d分", tl.studyMinutes];
        } else {
            cell.minutesLabel.text = [NSString stringWithFormat:@"%d時間%d分", tl.studyMinutes/60, tl.studyMinutes%60];
        }
        cell.moneyLabel.text = [NSString stringWithFormat:@"%d円", tl.expense];
        
        float interval = [[NSDate date] timeIntervalSinceDate:tl.created];
        if (interval > 60*60*24) {
            cell.datetimeLabel.text = [NSString stringWithFormat:@"%d日前", (int) interval / (60*60*24)];
        } else if (interval > 60*60) {
            cell.datetimeLabel.text = [NSString stringWithFormat:@"%d時間前", (int) interval / (60*60)];
        } else if (interval > 60) {
            cell.datetimeLabel.text = [NSString stringWithFormat:@"%d分前", (int) interval / (60)];
        } else {
            cell.datetimeLabel.text = [NSString stringWithFormat:@"%d秒前", (int) interval];
        }

        return cell;
        
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
