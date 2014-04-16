//
//  NewGuardianViewController.m
//  Students
//
//  Created by Jason Welch on 4/13/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "NewGuardianViewController.h"
#import "IDNumberDatabaseController.h"

@interface NewGuardianViewController ()

@property (nonatomic, strong) GuardianDataController *guardianDC;
//@property (nonatomic, strong) Guardian *createdGuardian;

@end

@implementation NewGuardianViewController

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
	[self configureView];
    // Do any additional setup after loading the view.
}

-(void)configureView {
	
	self.firstNameTextField.delegate = self;
	self.lastNameTextField.delegate = self;
//	self.genderSegmentedControl.delegate = self;
	self.phoneNumberTextField.delegate = self;
	self.houseNumberTextField.delegate = self;
	self.streetTextField.delegate = self;
	self.cityTextField.delegate = self;
	self.stateTextField.delegate = self;
	self.zipcodeTextField.delegate = self;
//	self.contactTypeSegmentedControl.delegate = self;
//	self.residentSegmentedControl.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The private returnNewGuardianObject is called to fill a new Guardian object
// The delegate is used to return the object to SelectAGuardianViewController
- (IBAction)addBarButtonPressed:(UIBarButtonItem *)sender {
	Guardian *newGuardian = [[Guardian alloc] init];
	newGuardian = [self returnNewGuardianObject];

#warning Guardian is not updating properly
	// The Guardian is added to the database but the values are not preserved for some reason
	[plistDC addToPlistObject:newGuardian];
	[self.createdGuardianDelegate didSelectNewGuardian:[self returnNewGuardianObject]];
}

// A new Guardian object is not passed
- (IBAction)cancelBarButtonPressed:(UIBarButtonItem *)sender {
	
	[self.createdGuardianDelegate didCancelNewGuardian];
}

#warning Checks should be made that proper values are entered into the form
// Assigns values within form to a new Guardian object
-(Guardian*)returnNewGuardianObject {
	
	Guardian *createdGuardian = [[Guardian alloc] init];
	IDNumberDatabaseController *idNumDB = [[IDNumberDatabaseController alloc] init]; // For new idNumber
	
	// A new ID number is made with the IDNumDB and this value is added to that list to prevent reuse
	createdGuardian.guardianIDNumber = [idNumDB getIDNumberForNewEntityWithType:@"person"];
	createdGuardian.firstName = self.firstNameTextField.text;
	createdGuardian.lastName = self.lastNameTextField.text;
	createdGuardian.phoneNumber = self.phoneNumberTextField.text;
	createdGuardian.houseNumber = self.houseNumberTextField.text;
	createdGuardian.street = self.streetTextField.text;
	createdGuardian.city = self.cityTextField.text;
	createdGuardian.state = self.stateTextField.text;
	createdGuardian.zipCode = (int)[self.zipcodeTextField.text intValue];
	createdGuardian.isMainContact = NO;
	createdGuardian.isEmergencyContact = NO;
	createdGuardian.isResidenceOfStudent = NO;
	
	// Segmented Controlls
	switch (self.genderSegmentedControl.selectedSegmentIndex) {
		case 0:
			createdGuardian.isMale = YES;
			break;
		case 1:
			createdGuardian.isMale = NO;
			break;
		default:
			break;
	}
	
	switch (self.contactTypeSegmentedControl.selectedSegmentIndex) {
		case 0:
			break;
		case 1:
			createdGuardian.isMainContact = YES;
			break;
		case 2:
			createdGuardian.isEmergencyContact = YES;
			break;
		default:
			break;
	}
	
	switch (self.residentSegmentedControl.selectedSegmentIndex) {
		case 0:
			createdGuardian.isResidenceOfStudent = YES;
			break;
		case 1:
			createdGuardian.isResidenceOfStudent = NO;
			break;
			
		default:
			break;
	}
	
	
	return createdGuardian;
}

#pragma mark - UITextFieldDelegate
// Dismisses the keyboard when Return is pressed
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[self.firstNameTextField resignFirstResponder];
	[self.lastNameTextField resignFirstResponder];
	[self.phoneNumberTextField resignFirstResponder];
	[self.houseNumberTextField resignFirstResponder];
	[self.streetTextField resignFirstResponder];
	[self.cityTextField resignFirstResponder];
	[self.stateTextField resignFirstResponder];
	[self.zipcodeTextField resignFirstResponder];
	return YES;
}

@end
