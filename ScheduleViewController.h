//
//  ScheduleViewController.h
//  Students
//
//  Created by Jason Welch on 3/1/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "ScheduleDataController.h"
#import "ScheduleItem.h"

@interface ScheduleViewController : UITableViewController

@property (strong, nonatomic) Student *selectedStudent;

@end
