//
//  StaffDetailViewController.h
//  Students
//
//  Created by Jason Welch on 4/12/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Staff.h"
#import "StaffDataController.h"

@interface StaffDetailViewController : UITableViewController

@property (strong, nonatomic) Staff *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *studentNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentGenderLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentTeacherLabel;
@property (weak, nonatomic) IBOutlet UIImageView *studentImagePic;


@end
