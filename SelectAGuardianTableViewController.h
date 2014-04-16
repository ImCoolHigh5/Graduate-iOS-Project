//
//  SelectAGuardianTableViewController.h
//  Students
//
//  Created by Jason Welch on 4/13/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuardianDataController.h"
#import "Guardian.h"
#import "NewGuardianViewController.h"

#pragma mark - Protocols
// For use with AddStudentView
@protocol SelectAGuardianTableViewControllerDelegate <NSObject>

-(void)didCancelGuardian;
-(void)didSelectGuardian:(Guardian*)guardian;

@end

@interface SelectAGuardianTableViewController : UITableViewController <NewGuardianViewControllerDelegate>

#pragma mark - Public Properties

@property (weak, nonatomic) id <SelectAGuardianTableViewControllerDelegate> addGuardianDelegate;

#pragma mark - IBActions

- (IBAction)okayBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)createNewGuardianPressed:(UIBarButtonItem *)sender;

@end
