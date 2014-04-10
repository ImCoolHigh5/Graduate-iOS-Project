//
//  DetailViewController.h
//  Students
//
//  Created by Jason Welch on 2/23/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "StaffDataController.h"

@interface StudentDetailViewController : UITableViewController

@property (strong, nonatomic) Student *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *studentNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentGenderLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentTeacherLabel;
@property (weak, nonatomic) IBOutlet UIImageView *studentImagePic;


@end
