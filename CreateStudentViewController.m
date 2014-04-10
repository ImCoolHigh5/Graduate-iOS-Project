//
//  CreateStudentViewController.m
//  Students
//
//  Created by Jason Welch on 4/2/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "CreateStudentViewController.h"

@interface CreateStudentViewController ()

@property (nonatomic, strong) StudentDataController *studentDataController;

@end

@implementation CreateStudentViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
	self.studentDataController = [[StudentDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
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

- (IBAction)createAccountButtonPressed:(id)sender {
	// make sure that all fields are entered and that the confirmed password matches the password
	
	if((self.firstNameTextField.text.length != 0) && (self.lastNameTextField.text.length != 0)) {
		
		[_studentDataController addStudentWtihFirstName:self.firstNameTextField.text lastName:self.lastNameTextField.text birthDate:self.birthDateDatePicker.date gpa:[[NSString stringWithFormat:@"%@",self.gpaTextField.text] floatValue] county:@"Same" gender:/*self.genderSegmentedControl*/NO gradTime:[NSString stringWithFormat:@"%@ %@",@"Spring",self.gradYearTextField.text] homeroom:self.homeroomTextField.text studentIDNumber:(int)[self.studentDataController studentCount] image:@"genericPicture.jpg"];
		
//		[[NSUserDefaults standardUserDefaults] setObject:self.usernameTextField.text forKey:USERNAME];
//		[[NSUserDefaults standardUserDefaults] setObject:self.passwordTextField.text forKey:PASSWORD];
//		[[NSUserDefaults standardUserDefaults] synchronize];
		
		[self.delegate didCreateAccount];
	}
	else {
		UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
																 message:@"Please make sure that you have filled in all text fields and that you have properly confirmed your password"
																delegate:nil
													   cancelButtonTitle:@"Okay"
													   otherButtonTitles: nil];
		[errorAlertView show];
	}
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
	[self.delegate didCancel];
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	
//	[_textField resignFirstResponder];
	return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	
	if ([text isEqualToString:@"\n"]) {
//		[_textView resignFirstResponder];
		return NO;
	}
	return YES;
}

@end
