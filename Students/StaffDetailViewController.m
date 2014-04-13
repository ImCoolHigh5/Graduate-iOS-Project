//
//  StaffDetailViewController.m
//  Students
//
//  Created by Jason Welch on 4/12/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "StaffDetailViewController.h"

@interface StaffDetailViewController ()
- (void)configureView;
@end

@implementation StaffDetailViewController

#pragma mark - Managing the detail item

// Handles the selected Student object sent in the segue, placing it in newDetailItem
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }
}

- (void)configureView
{


	if (self.detailItem) {
	    self.studentNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.detailItem.firstName, self.detailItem.lastName];
		self.studentNumberLabel.text = [NSString stringWithFormat:@"%01.0d", self.detailItem.studentIDNumber];
		// Gender is a bool, with boys being true
		if (self.detailItem.isMale) {
			self.studentGenderLabel.text = @"Male";
		} else {
			self.studentGenderLabel.text = @"Female";
		}

		self.studentTeacherLabel.text = [StaffDataController getStaffNameWithID:self.detailItem.homeroomTeacherID];
		self.studentImagePic.image = [UIImage imageNamed:@"placeholder.png"]; // uses a string of the image file name

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

@end
