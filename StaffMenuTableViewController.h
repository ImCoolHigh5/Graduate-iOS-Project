//
//  StaffMenuTableViewController.h
//  Students
//
//  Created by Jason Welch on 4/14/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Staff.h"
#import "StaffDetailTableViewController.h"
#import "ScheduleViewController.h"

@interface StaffMenuTableViewController : UITableViewController

@property (strong, nonatomic) Staff *selectedStaff;
@property (weak, nonatomic) IBOutlet UINavigationItem *staffMenuNavBar;

@end
