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


- (IBAction)addStudentBarButtonPressed:(UIBarButtonItem *)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
