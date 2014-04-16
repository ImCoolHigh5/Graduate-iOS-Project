//
//  StaffListTableViewController.m
//  Students
//
//  Created by Jason Welch on 4/14/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "StaffListTableViewController.h"
#import "StaffDataController.h"
#import "Staff.h"
#import "StaffMenuTableViewController.h"

@interface StaffListTableViewController ()

@property (nonatomic, strong) StaffDataController *staffDataController;

@end

@implementation StaffListTableViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
	self.staffDataController = [[StaffDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Table View

// Grouping isn't used
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.staffDataController staffCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	
	Staff *staff = [self.staffDataController staffAtIndex:indexPath.row];
	
	// Fills each row with a student in a Last, First format
	NSString *fullName = [NSString stringWithFormat:@"%@, %@", staff.lastName, staff.firstName];
	cell.textLabel.text = fullName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

// Sends the selected Staff object to the StaffMenuView
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

	if ([segue.destinationViewController isKindOfClass:[StaffMenuTableViewController class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		Staff *selectedStaff = [[Staff alloc] init];
		selectedStaff = [self.staffDataController staffAtIndex:indexPath.row];
        [[segue destinationViewController] setSelectedStaff:selectedStaff];
    }
}

@end