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

@property (strong, nonatomic) Student *selectedStudent;
@property (weak, nonatomic) IBOutlet UINavigationItem *studentMenuNavBar;


@end
