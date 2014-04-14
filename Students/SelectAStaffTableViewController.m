//
//  SelectAStaffTableViewController.m
//  Students
//
//  Created by Jason Welch on 4/13/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "SelectAStaffTableViewController.h"

@interface SelectAStaffTableViewController ()

@property (nonatomic, strong) StaffDataController *staffDC;
@property (nonatomic, strong) Staff *selectedStaff;

@end

@implementation SelectAStaffTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
	self.staffDC = [[StaffDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Table View

// Grouping isn't used
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.staffDC staffCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	
	Staff *staff = [self.staffDC staffAtIndex:indexPath.row];
	
	// Fills each row with a staff
	NSString *fullName = [staff getFullName];
	cell.textLabel.text = fullName;
	
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Sets the staff to be chosen
	self.selectedStaff = [self.staffDC staffAtIndex:indexPath.row];
	[self.addStaffDelegate didSelectStaff:self.selectedStaff];
	
}
// Select that Staff and get outta there
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	self.selectedStaff = [self.staffDC staffAtIndex:indexPath.row];
	[self.addStaffDelegate didSelectStaff:self.selectedStaff];
	
}

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender {
	[self.addStaffDelegate didCancelStaff];
}

@end