//
//  SelectCountyTableViewController.h
//  Students
//
//  Created by Jason Welch on 7/8/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

#pragma mark - Protocols
@protocol SelectCountyTableViewControllerDelegate <NSObject>

-(void)didCancelCounty;
-(void)didSelectCounty:(NSString*)county;

@end

@interface SelectCountyTableViewController : UITableViewController

#pragma mark - Public Properties

@property (weak, nonatomic) id <SelectCountyTableViewControllerDelegate> addCountyDelegate;

#pragma mark - IBActions

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender;

@end
