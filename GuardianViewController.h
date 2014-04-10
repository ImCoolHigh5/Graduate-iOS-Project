//
//  GuardianViewController.h
//  Students
//
//  Created by Jason Welch on 3/17/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "GuardianDataController.h"
#import "ScheduleItem.h"

@interface GuardianViewController : UITableViewController

@property (strong, nonatomic) Student *selectedStudent;

@end
