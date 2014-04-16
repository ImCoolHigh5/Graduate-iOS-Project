//
//  StudentListViewController.h
//  Students
//
//  Created by Jason Welch on 2/23/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddStudentViewController.h"

@interface StudentListViewController : UITableViewController <AddStudentViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

#pragma mark - IBOutlets

@property (strong, nonatomic) IBOutlet UITableView *tableView;

#pragma mark - IBActions

- (IBAction)addStudentBarButtonPressed:(UIBarButtonItem *)sender;

@end
