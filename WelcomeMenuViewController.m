//
//  WelcomeMenuViewController.m
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "WelcomeMenuViewController.h"

/****** These items are for test purposes only and may be unneccessary later ****/
#import "StaffDataController.h"
#import "Staff.h"
#import "Schedule.h"
#import "ScheduleDataController.h"
#import "Student.h"

#define MyLog if(0); else NSLog
/****** ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ****/
@interface WelcomeMenuViewController ()

@end

@implementation WelcomeMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Loads the button graphics behind the buttons
	self.studentsMenuButton.backgroundColor = [UIColor clearColor];
	self.testMenuButton.backgroundColor = [UIColor clearColor];
	UIEdgeInsets insets = UIEdgeInsetsMake(12.0f, 12.0f, 12.0f, 12.0f);
	UIImage *buttonImage = [[UIImage imageNamed:@"buttonbg"] resizableImageWithCapInsets:insets];
	[self.studentsMenuButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
	[self.testMenuButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)runTest:(id)sender {
//	StaffDataController *testing = [[StaffDataController alloc] init];
//	for (int i = 0; i < [testing staffCount]; i++) {
//		Staff *thisStaff = [[Staff alloc] init];
//		thisStaff = [testing staffAtIndex:i];
//		NSArray *thisSchedule = [[NSArray alloc] init];
//		thisSchedule = [ScheduleDataController createScheduleForScheduleID:thisStaff.scheduleID];
//		
//		MyLog(@"%@", thisStaff.lastName);
//	}
//	MyLog(@"%@", testing.studentSchedule);
	NSArray *newStudentGuardians = [[NSArray alloc] initWithObjects:@14, nil];
	Student *newStudent = [[Student alloc] initWithStudentIDNumber:505 andFirstName:@"Paul" andLastName:@"Dean" andAreTheyMale:YES andHomeroomTeacherID:27 andGuardianIDArray:newStudentGuardians andScheduleID:16];
	
	
//	NSArray *testArray = [[NSArray alloc] initWithArray:[newStudent prepareForUploadTest]];
	[newStudent printStudent];
	[plistDC addToPlistObject:newStudent];
	
}

@end
