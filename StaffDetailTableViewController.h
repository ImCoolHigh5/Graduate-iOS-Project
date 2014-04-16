//
//  StaffDetailTableViewController.h
//  Students
//
//  Created by Jason Welch on 4/14/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Staff.h"

@interface StaffDetailTableViewController : UITableViewController

#pragma mark - IBOutlets

@property (strong, nonatomic) Staff *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *staffNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *staffNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *staffGenderLabel;
@property (weak, nonatomic) IBOutlet UILabel *staffSubjectLabel;
@property (weak, nonatomic) IBOutlet UIImageView *staffImagePic;

@end
