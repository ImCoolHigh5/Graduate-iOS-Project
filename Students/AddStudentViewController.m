//
//  AddStudentViewController.m
//  Students
//
//  Created by Jason Welch on 4/13/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "AddStudentViewController.h"
#import "IDNumberDatabaseController.h"

@interface AddStudentViewController ()
-(void)configureView;
@property (nonatomic, strong) NSMutableArray *addedGuardians;
@property (nonatomic) int addedStaffID;
@end

@implementation AddStudentViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	_addedGuardians = [[NSMutableArray alloc] init];
	[self configureView];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
	// We want to see the selec option first
	self.selectTeacherButton.hidden = NO;
	
	// So we hide the placeholder name until it is assigned
	self.homeroomTeacherLabel.hidden = YES;
	
	// These labels will only appear once a Guardian has been added
	self.firstGuardianLabel.hidden = YES;
	self.secondGuardianLabel.hidden = YES;
	self.thirdGuardianLabel.hidden = YES;
	self.forthGuardianLabel.hidden = YES;
	
}

#pragma mark - AddStudent Delegation

- (IBAction)addBarButtonPressed:(UIBarButtonItem *)sender {
	// First item of our protocol, storing a Student item to use in the previous view
	[self.addStudentDelegate didAddStudent:[self returnNewStudentObject]];
}

- (IBAction)cancelBarButtonPressed:(UIBarButtonItem *)sender {
	// Second and final item of our protocol, canceling the creation of a new task
	[self.addStudentDelegate didCancel];
}

#pragma mark - Helper Methods

-(Student*)returnNewStudentObject {
	
	Student *newStudent = [[Student alloc] init]; // Student created
	IDNumberDatabaseController *idNumDB = [[IDNumberDatabaseController alloc] init]; // For new idNumber
	NSMutableArray *guardianIDs = [[NSMutableArray alloc] init]; // For Guardian references
	
	// self.addedGuardians will be filled with any Guardians the user has already selected
	for (int i = 0; i < [_addedGuardians count]; i++) {
		Guardian *thisGuardian = _addedGuardians[i];
		NSString *thisGuardianIDNumber = [NSString stringWithFormat:@"%i",thisGuardian.guardianIDNumber];
		[guardianIDs addObject:thisGuardianIDNumber];
	}
	NSArray *guardians = [[NSArray alloc] initWithArray:guardianIDs]; // For new guardians
	
	// New idNumber is generated with the IDNumDatabase and added to the list to avoid duplicate references
	newStudent.studentIDNumber = [idNumDB getIDNumberForNewEntityWithType:STUDENT_PLIST_TITLE];
	newStudent.firstName = self.firstNameTextField.text;
	newStudent.lastName = self.lastNameTextField.text;
	newStudent.homeroomTeacherID = _addedStaffID;
	newStudent.guardianIDArray = guardians;
	// Segmented Control sets the gender
	switch (self.genderSegmentedControl.selectedSegmentIndex) {
		case 0:
			newStudent.isMale = YES;
			break;
		case 1:
			newStudent.isMale = NO;
			break;
		default:
			break;
	}
	return newStudent;
}

// Tests to see how many Guardians should be displayed
-(void)displayAllNewGuardians {
	
	if ([_addedGuardians count] > 3) { // Don't want too many Guardians
		self.addGuardianButton.hidden = YES; // Should hide if there are 4 or more guardians
	}
	if ([_addedGuardians count] > 0) {
		self.firstGuardianLabel.hidden = NO;
		self.firstGuardianLabel.text = [_addedGuardians[0] getFullName]; // Assumes the array is filled wiht Guardians
	}
	if ([_addedGuardians count] > 1) {
		self.secondGuardianLabel.hidden = NO;
		self.secondGuardianLabel.text = [_addedGuardians[1] getFullName];
	}
	if ([_addedGuardians count] > 2) {
		self.thirdGuardianLabel.hidden = NO;
		self.thirdGuardianLabel.text = [_addedGuardians[2] getFullName];
	}
	if ([_addedGuardians count] > 3) {
		self.forthGuardianLabel.hidden = NO;
		self.forthGuardianLabel.text = [_addedGuardians[3] getFullName];
	}
}

#pragma mark - Segues

- (IBAction)selectTeacherButtonPressed:(UIButton *)sender {
	
	[self performSegueWithIdentifier:@"toSelectAStaffViewSegue" sender:nil];
}

- (IBAction)addGuardianButtonPressed:(UIButton *)sender {
	[self performSegueWithIdentifier:@"toSelectAGuardianViewSegue" sender:nil];
	
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// If we are seguing to the SelectAGuardianTableViewController...
	if ([segue.destinationViewController isKindOfClass:[SelectAGuardianTableViewController class]]) {
		SelectAGuardianTableViewController *selectGuardian = segue.destinationViewController;
		selectGuardian.addGuardianDelegate = self;
	}
	// If we are seguing to the SelectAStaffTableViewController...
	else if ([segue.destinationViewController isKindOfClass:[SelectAStaffTableViewController class]]) {
		SelectAStaffTableViewController *selectStaff = segue.destinationViewController;
		selectStaff.addStaffDelegate = self;
	}
}

#pragma mark - Delegates

// Adding Guardians for Student
-(void)didSelectGuardian:(Guardian *)guardian {
	// Updates the Guardian list
	[self.addedGuardians addObject:guardian];
	[self displayAllNewGuardians];
	// dismisses this view from the stack
	[self dismissViewControllerAnimated:YES completion:nil];
	
}

// No new Guardian selected
-(void)didCancelGuardian {
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

// Selecting Homeroom teacher
-(void)didSelectStaff:(Staff *)staff {
	
	// Don't want them picking multiple staff
	self.selectTeacherButton.hidden = YES;
	
	// Update the Teacher Name
	self.homeroomTeacherLabel.hidden = NO;
	self.homeroomTeacherLabel.text = [staff getFullName];
	self.addedStaffID = staff.staffIDNumber;
	
	// dismisses this view from the stack
	[self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCancelStaff {
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
