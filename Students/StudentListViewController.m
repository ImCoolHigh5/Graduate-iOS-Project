//
//  StudentListViewController.m
//  Students
//
//  Created by Jason Welch on 2/23/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "StudentListViewController.h"
#import "StudentDetailViewController.h"
#import "StudentMenuViewController.h"
#import "StudentDataController.h"
#import "Student.h"

@interface StudentListViewController ()

	@property (nonatomic, strong) StudentDataController *studentDataController;

@end

@implementation StudentListViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
	self.studentDataController = [[StudentDataController alloc] init];
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
	return [self.studentDataController studentCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	
	Student *student = [self.studentDataController studentAtIndex:indexPath.row];

	// Fills each row with a student in a Last, First format
	NSString *fullName = [NSString stringWithFormat:@"%@, %@", student.lastName, student.firstName];
	cell.textLabel.text = fullName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

// Sends the selected Student object to the StudentMenuView
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowStudentMenu"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		Student *student = [self.studentDataController studentAtIndex:indexPath.row];
        [[segue destinationViewController] setSelectedStudent:student];
    }
}

@end
