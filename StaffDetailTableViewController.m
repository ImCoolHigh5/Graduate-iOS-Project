//
//  StaffDetailTableViewController.m
//  Students
//
//  Created by Jason Welch on 4/14/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "StaffDetailTableViewController.h"

@interface StaffDetailTableViewController ()
- (void)configureView;
@end

@implementation StaffDetailTableViewController

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
	    self.staffNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.detailItem.firstName, self.detailItem.lastName];
		self.staffNumberLabel.text = [NSString stringWithFormat:@"%01.0d", self.detailItem.staffIDNumber];
		// Gender is a bool, with boys being true
		if (self.detailItem.isMale) {
			self.staffGenderLabel.text = @"Male";
		} else {
			self.staffGenderLabel.text = @"Female";
		}
		
		self.staffSubjectLabel.text = self.detailItem.subject;
		self.staffImagePic.image = [UIImage imageNamed:@"placeholder.png"]; // uses a string of the image file name
		
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
