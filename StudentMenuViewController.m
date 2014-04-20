//
//  StudentMenuViewController.m
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "StudentMenuViewController.h"

@implementation StudentMenuViewController

#pragma mark - Managing the detail item
// Handles the selected Student object sent in the segue, placing it in newDetailItem
- (void)setSelectedStudent:(id)newDetailItem
{
    if (_selectedStudent != newDetailItem) {

        _selectedStudent = newDetailItem;
        [self configureView];
    }
}

- (void)configureView
{
	// If a Student object was sent, put their name in the NavBar
	if (self.selectedStudent) {
		self.studentMenuNavBar.title = [NSString stringWithFormat:@"%@, %@", self.selectedStudent.lastName, self.selectedStudent.firstName];
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

#pragma mark - Segues

// Sends the received Student object to the chosen view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowStudentDetails"]) {
        [[segue destinationViewController] setDetailItem:_selectedStudent];
    } else if ([[segue identifier] isEqualToString:@"ShowStudentSchedule"]) {
		[[segue destinationViewController] setSelectedStudent:_selectedStudent];
	} else if ([[segue identifier] isEqualToString:@"ShowStudentGuardians"]) {
		[[segue destinationViewController] setSelectedStudent:_selectedStudent];
	}
}

@end
