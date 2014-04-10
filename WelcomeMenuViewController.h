//
//  WelcomeMenuViewController.h
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeMenuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *studentsMenuButton;
@property (weak, nonatomic) IBOutlet UIButton *testMenuButton;

- (IBAction)runTest:(id)sender;
@end
