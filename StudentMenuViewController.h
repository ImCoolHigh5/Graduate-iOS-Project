//
//  StudentMenuViewController.h
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "StudentDetailViewController.h"
#import "ScheduleViewController.h"

@interface StudentMenuViewController : UITableViewController
#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UINavigationItem *studentMenuNavBar;

#pragma mark - Public Properties

@property (strong, nonatomic) Student *selectedStudent;

@end
