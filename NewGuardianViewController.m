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
	//	self.genderSegmentedControl;
	self.phoneNumberTextField.delegate = self;
	self.houseNumberTextField.delegate = self;
	self.streetTextField.delegate = self;
	self.cityTextField.delegate = self;
	self.stateTextField.delegate = self;
	self.zipcodeTextField.delegate = self;
	//	self.contactTypeSegmentedControl;
	//	self.residentSegmentedControl;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(Guardian*)returnNewGuardianObject {
	
	Guardian *createdGuardian = [[Guardian alloc] init];
	
	IDNumberDatabaseController *idNumDB = [[IDNumberDatabaseController alloc] init]; // For new idNumber
	
	createdGuardian.guardianIDNumber = [idNumDB getIDNumberForNewEntityWithType:@"person"];
	createdGuardian.firstName = self.firstNameTextField.text;
	createdGuardian.lastName = self.lastNameTextField.text;
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
	createdGuardian.phoneNumber = self.phoneNumberTextField.text;
	createdGuardian.houseNumber = self.houseNumberTextField.text;
	createdGuardian.street = self.streetTextField.text;
	createdGuardian.city = self.cityTextField.text;
	createdGuardian.state = self.stateTextField.text;
	createdGuardian.zipCode = (int)[self.zipcodeTextField.text intValue];
	createdGuardian.isMainContact = NO;
	createdGuardian.isEmergencyContact = NO;
	createdGuardian.isResidenceOfStudent = NO;
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
- (IBAction)addBarButtonPressed:(UIBarButtonItem *)sender {
	Guardian *newGuardian = [[Guardian alloc] init];
	newGuardian = [self returnNewGuardianObject];
#warning Guardian is not updating properly
	[plistDC addToPlistObject:newGuardian];
	[self.createdGuardianDelegate didSelectNewGuardian:[self returnNewGuardianObject]];
}

- (IBAction)cancelBarButtonPressed:(UIBarButtonItem *)sender {
	[self.createdGuardianDelegate didCancelNewGuardian];
}

#pragma mark - UITextFieldDelegate

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

//-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//	
//	if ([text isEqualToString:@"\n"]) {
//		[_textView resignFirstResponder];
//		return NO;
//	}
//	return YES;
//}
@end
