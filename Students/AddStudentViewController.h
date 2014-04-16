//
//  AddStudentViewController.h
//  Students
//
//  Created by Jason Welch on 4/13/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Guardian.h"
#import "SelectAGuardianTableViewController.h"
#import "SelectAStaffTableViewController.h"

#pragma mark - Protocols

@protocol AddStudentViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)didAddStudent:(Student*)student;

@end

@interface AddStudentViewController : UIViewController <SelectAGuardianTableViewControllerDelegate, SelectAStaffTableViewControllerDelegate>

#pragma mark - IBOutlets

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSegmentedControl;
@property (strong, nonatomic) IBOutlet UILabel *homeroomTeacherLabel;
@property (strong, nonatomic) IBOutlet UILabel *firstGuardianLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondGuardianLabel;
@property (strong, nonatomic) IBOutlet UILabel *thirdGuardianLabel;
@property (strong, nonatomic) IBOutlet UILabel *forthGuardianLabel;
@property (strong, nonatomic) IBOutlet UIButton *selectTeacherButton;
@property (strong, nonatomic) IBOutlet UIButton *addGuardianButton;


#pragma mark - Public Properties

@property (weak, nonatomic) id <AddStudentViewControllerDelegate> addStudentDelegate;

#pragma mark - IBActions

- (IBAction)addBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)cancelBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)selectTeacherButtonPressed:(UIButton *)sender;
- (IBAction)addGuardianButtonPressed:(UIButton *)sender;

@end