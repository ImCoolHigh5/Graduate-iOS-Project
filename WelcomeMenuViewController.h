//
//  WelcomeMenuViewController.h
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeMenuViewController : UIViewController

#pragma mark - IBOutlets

@property (weak, nonatomic) IBOutlet UIButton *studentsMenuButton;
@property (strong, nonatomic) IBOutlet UIButton *staffMenuButton;
@property (weak, nonatomic) IBOutlet UIButton *testMenuButton;

#pragma mark - IBActions

- (IBAction)runTest:(id)sender;
@end
