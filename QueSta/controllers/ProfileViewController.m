//
//  ProfileViewController.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileCell.h"
#import "SwitchCell.h"
#import "GraphCell.h"
#import "Graph7DaysCell.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_background.png"]];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    _tableView.backgroundColor = [UIColor clearColor];
    
    _segmentedControlStatus = 0;    // 統計
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)changeSegmentedControl:(id)sender
{
    UISegmentedControl *sc = sender;
    _segmentedControlStatus = sc.selectedSegmentIndex;
    [_tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 160.0f;
    } else if (indexPath.row == 1) {
        return 44.0f;
    } else {
        return 255.0f;
    }
}

/*
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {   // switchCell
        cell.backgroundColor = [UIColor darkGrayColor];
    }
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        static NSString *CellIdentifier = @"ProfileCell";
        ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        cell.profileImageView.layer.cornerRadius = 8.0f;
        cell.profileImageView.clipsToBounds = YES;
        
        CALayer *layer = [cell.badgeImageView layer];
        [layer setMasksToBounds:YES];
        [layer setBorderWidth: 1.f];
        [layer setBorderColor:[[UIColor grayColor] CGColor]];
        
        return cell;
    } else if (indexPath.row == 1) {
        static NSString *CellIdentifier = @"SwitchCell";
        SwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        return cell;
    } else {
        if (!_segmentedControlStatus) { // 統計
            static NSString *CellIdentifier = @"GraphCell";
            GraphCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            
            cell.graphBackgroundView.layer.cornerRadius = 5.0f;
            cell.graphBackgroundView.clipsToBounds = YES;
            
            cell.graphView.layer.cornerRadius = 4.0f;
            cell.graphView.clipsToBounds = YES;
            
            cell.containerView.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
            cell.containerView.layer.shadowOpacity = 0.2f;
            cell.containerView.layer.shadowOffset = CGSizeMake(0, 2.0f);
            
            return cell;
        } else {    // 過去7日間
            static NSString *CellIdentifier = @"Graph7DaysCell";
            Graph7DaysCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            return cell;
        }
    }

}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
