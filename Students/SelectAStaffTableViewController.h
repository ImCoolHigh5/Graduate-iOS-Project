//
//  SelectAStaffTableViewController.h
//  Students
//
//  Created by Jason Welch on 4/13/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Staff.h"
#import "StaffDataController.h"

@protocol SelectAStaffTableViewControllerDelegate <NSObject>

-(void)didCancelStaff;
-(void)didSelectStaff:(Staff*)staff;

@end

@interface SelectAStaffTableViewController : UITableViewController

@property (weak, nonatomic) id <SelectAStaffTableViewControllerDelegate> addStaffDelegate;
- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender;

@end
