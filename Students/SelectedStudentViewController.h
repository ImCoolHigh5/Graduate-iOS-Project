//
//  SelectedStudentViewController.h
//  Students
//
//  Created by Jason Welch on 2/26/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface SelectedStudentViewController : UIViewController

@property (strong, nonatomic) Student *detailItem;
@property (weak, nonatomic) IBOutlet UINavigationItem *selectedStudentNavBar;

@end
