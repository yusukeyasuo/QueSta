//
//  TLViewController.m
//  QueSta
//
//  Created by yusuke_yasuo on 2013/03/09.
//  Copyright (c) 2013年 yusuke_yasuo. All rights reserved.
//

#import "TLViewController.h"
#import "TLCell.h"

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_background.png"]];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TLCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    cell.profileImageView.layer.cornerRadius = 8.0f;
    cell.profileImageView.clipsToBounds = YES;
    
    cell.containerView.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1];
    cell.containerView.layer.shadowOpacity = 0.2f;
    cell.containerView.layer.shadowOffset = CGSizeMake(0, 2.0f);

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
