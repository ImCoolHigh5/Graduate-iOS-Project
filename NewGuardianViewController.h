//
//  NewGuardianViewController.h
//  Students
//
//  Created by Jason Welch on 4/13/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuardianDataController.h"
#import "Guardian.h"

// For the use of SelectAGuardianTableViewController

#pragma mark - Protocols
@protocol NewGuardianViewControllerDelegate <NSObject>

-(void)didCancelNewGuardian;
-(void)didSelectNewGuardian:(Guardian*)createdGuardian;

@end

@interface NewGuardianViewController : UIViewController <UITextFieldDelegate>

#pragma mark - IBOutlets

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSegmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *houseNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *streetTextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *zipcodeTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *contactTypeSegmentedControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *residentSegmentedControl;


#pragma mark - Public Properties

@property (weak, nonatomic) id <NewGuardianViewControllerDelegate> createdGuardianDelegate;

#pragma mark - IBActions

- (IBAction)addBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)cancelBarButtonPressed:(UIBarButtonItem *)sender;

@end
