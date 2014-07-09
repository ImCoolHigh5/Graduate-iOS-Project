//
//  DetailViewController.m
//  Students
//
//  Created by Jason Welch on 2/23/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "StudentDetailViewController.h"

@interface StudentDetailViewController ()

- (void)configureView;

@end

@implementation StudentDetailViewController

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
		// Photo importing is not yet a feature, so...
		self.studentImagePic.image = [UIImage imageNamed:@"placeholder.png"]; // uses a string of the image file name
		self.countyLabel.text = self.detailItem.county;
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
