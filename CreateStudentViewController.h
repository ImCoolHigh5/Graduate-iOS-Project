//
//  CreateStudentViewController.h
//  Students
//
//  Created by Jason Welch on 4/2/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentDataController.h"

// these will function as the keys for the ListOfStudents.plist
#define FIRST_NAME @"firstName"
#define LAST_NAME @"lastName"
#define BIRTH_DATE_FORMAT @"yyy-MM-dd"


// protocol methods declaration
@protocol CreateStudentViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)didCreateAccount;

@end


@interface CreateStudentViewController : UIViewController

// protocol property declaration
@property (weak, nonatomic) id <CreateStudentViewControllerDelegate> delegate;

#pragma mark - IBOutlets

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *homeroomTextField;
@property (strong, nonatomic) IBOutlet UITextField *gpaTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSegmentedControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gradSeasonSegmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *gradYearTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *birthDateDatePicker;


#pragma mark - IBActions
- (IBAction)createAccountButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender;



#pragma mark - Public Methods



@end