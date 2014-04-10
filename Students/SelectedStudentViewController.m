//
//  SelectedStudentViewController.m
//  Students
//
//  Created by Jason Welch on 2/26/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "SelectedStudentViewController.h"

@interface SelectedStudentViewController ()

@end

@implementation SelectedStudentViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GeneralInfoSelect"]) {
        [[segue destinationViewController] setDetailItem:self.detailItem];
    }
}

@end
