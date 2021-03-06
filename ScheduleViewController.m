//
//  ScheduleViewController.m
//  Students
//
//  Created by Jason Welch on 3/1/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "ScheduleViewController.h"


@interface ScheduleViewController ()

//@property (nonatomic, strong) ScheduleDataController *scheduleDataController;
@property (nonatomic, strong) NSArray *schedule;

@end

@implementation ScheduleViewController


#pragma mark - Managing the detail item

- (void)setSelectedStudent:(id)newDetailItem
{
    if (_selectedStudent != newDetailItem) {
        _selectedStudent = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)setSelectedStaff:(id)newDetailItem
{
    if (_selectedStaff != newDetailItem) {
        _selectedStaff = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
	// Update the user interface for the detail item.
	
	if (self.selectedStudent) {
		_schedule = [ScheduleDataController createScheduleForScheduleID:_selectedStudent.scheduleID];
		
	} else if (self.selectedStaff) {
		_schedule = [ScheduleDataController createScheduleForScheduleID:_selectedStaff.scheduleID];
		
	}
}



- (void)awakeFromNib
{
    [super awakeFromNib];
	//	self.scheduleDataController = [[ScheduleDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

// Returns number of schedule items to be displayed
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// take a count of the internal schedule array
	return [_schedule count];
}

// This may need to be more extensive but for now there room for Name, Teacher, and Room
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 3;
}

// Loads the cells into the sections
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *sectionName = [[NSString alloc] init];
	// Since AM and PM Homeroom aren't technically Periods, I added this switch to exclude them in the count.
	// take a count of the internal schedule array
	int lastSection = (int)[_schedule count];
	lastSection--;
	if (section == 0) {
		sectionName = nil;
	} else if ((int)section == lastSection){
		sectionName = nil;
	} else {
		sectionName = [NSString stringWithFormat:@"Period %lu", (long)section]; // the NSInteger section is cast as a long to make the string tag easier
	}
	return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	
	// Makes a new scheduleItem from the student's schedule Array at the index specified by the tableView
	ScheduleItem *scheduleItem = [_schedule objectAtIndex:indexPath.section];
	
	NSString *cellTitle = [[NSString alloc] init];
	// Tests to see which element needs to be pulled, depending on the cell in this section
	switch (indexPath.row) {
		case 0:
			cellTitle = [NSString stringWithFormat:@"%@", scheduleItem.name];
			break;
		case 1:
			cellTitle = [NSString stringWithFormat:@"%@", scheduleItem.teacher];
			break;
		case 2:
			cellTitle = [NSString stringWithFormat:@"Room %@", scheduleItem.roomNumber];
			break;
			
		default:
			cellTitle = @"Oops!";
			break;
	}
	
	cell.textLabel.text = cellTitle;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}



@end
