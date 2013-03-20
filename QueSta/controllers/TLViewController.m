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

    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0.349 blue:0.698 alpha:1]; /*#0059b2*/
    _tableView.backgroundColor = [UIColor clearColor];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            return 10;
            break;
    }
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 170;
            break;
            
        case 1:
            return 44;
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
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"black_background.png"]];
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
        
        return cell;
        
    } else if (indexPath.section == 1) {
        static NSString *CellIdentifier = @"LabelCell";
        LabelCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        return cell;
        
    } else {
        static NSString *CellIdentifier = @"Cell";
        TLCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

        cell.profileImageView.layer.cornerRadius = 8.0f;
        cell.profileImageView.clipsToBounds = YES;
        
        cell.containerView.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
        cell.containerView.layer.shadowOpacity = 0.2f;
        cell.containerView.layer.shadowOffset = CGSizeMake(0, 2.0f);

        return cell;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
