//
//  StaffMenuTableViewController.m
//  Students
//
//  Created by Jason Welch on 4/14/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "StaffMenuTableViewController.h"

@interface StaffMenuTableViewController ()

@end

@implementation StaffMenuTableViewController

#pragma mark - Managing the detail item
// Handles the selected Staff object sent in the segue, placing it in newDetailItem
- (void)setSelectedStaff:(id)newDetailItem
{
    if (_selectedStaff != newDetailItem) {
		
        _selectedStaff = newDetailItem;
        [self configureView];
    }
}

- (void)configureView
{
	// If a Staff object was sent, put their name in the NavBar
	if (self.selectedStaff) {
		self.staffMenuNavBar.title = [NSString stringWithFormat:@"%@, %@", self.selectedStaff.lastName, self.selectedStaff.firstName];
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation Control

// Sends the received Staff object to the chosen view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toStaffDetailViewSegue"]) {
        [[segue destinationViewController] setDetailItem:_selectedStaff];
    } else if ([[segue identifier] isEqualToString:@"toScheduleViewForStaffSegue"]) {
	   		[[segue destinationViewController] setSelectedStaff:_selectedStaff];
	   	} /*
	   //	else if ([[segue identifier] isEqualToString:@"ShowStudentGuardians"]) {
	   //		[[segue destinationViewController] setSelectedStudent:_selectedStaff];
	   //	} */
}


@end