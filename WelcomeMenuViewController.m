//
//  WelcomeMenuViewController.m
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "WelcomeMenuViewController.h"
#import "TestButtonDataController.h"

@interface WelcomeMenuViewController ()

@end

@implementation WelcomeMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
			   bundle:(NSBundle *)nibBundleOrNil
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
	self.staffMenuButton.backgroundColor = [UIColor clearColor];
	self.testMenuButton.backgroundColor = [UIColor clearColor];
	
	self.staffMenuButton.hidden = YES;
	self.testMenuButton.hidden = YES;
	
	UIEdgeInsets insets = UIEdgeInsetsMake(12.0f, 12.0f, 12.0f, 12.0f);
	UIImage *buttonImage = [[UIImage imageNamed:@"buttonbg"] resizableImageWithCapInsets:insets];
	
	[self.studentsMenuButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
	[self.staffMenuButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
	[self.testMenuButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)runTest:(id)sender {
	
	TestButtonDataController *testing = [[TestButtonDataController alloc] init];
	
	[testing runTests]; // Now used to generate sample data from plists
	
}

@end
