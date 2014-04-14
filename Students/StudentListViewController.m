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
@property (nonatomic, strong) NSMutableArray *studentArray;

@end

@implementation StudentListViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
	self.studentDataController = [[StudentDataController alloc] init];
	self.studentArray = [[NSMutableArray alloc] initWithArray:[_studentDataController getArrayOfStudents]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Allows me to implement data source methods.
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
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
	return [self.studentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	
	Student *student = self.studentArray[indexPath.row];

	// Fills each row with a student in a Last, First format
	NSString *fullName = [NSString stringWithFormat:@"%@, %@", student.lastName, student.firstName];
	cell.textLabel.text = fullName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Sends the selected Student object to the StudentMenuView
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// If we are seguing to the AddTaskViewController...
	if ([segue.destinationViewController isKindOfClass:[AddStudentViewController class]]) {
		AddStudentViewController *addStudentViewController = segue.destinationViewController;
		addStudentViewController.addStudentDelegate = self;
	}
	else if ([[segue identifier] isEqualToString:@"ShowStudentMenu"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		Student *student = self.studentArray[indexPath.row];
        [[segue destinationViewController] setSelectedStudent:student];
    }
}

// Allows items in the list to be deleted by swiping
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (editingStyle == UITableViewCellEditingStyleDelete) { // if the motion is for deleting a cell
		[self.studentArray removeObjectAtIndex:indexPath.row]; // remove that object from our array
		
		NSMutableArray *newStudentData = [[NSMutableArray alloc] init];
		
		for (Student *student in self.studentArray) {
			// Take each student and turn it into a dictionary for updating the plist
			[newStudentData addObject:[student prepareForUpload]];
		}
		// Pack it into an NSArray for uploading
		NSArray *updatedArray = [[NSArray alloc] initWithArray:newStudentData];
		// Find a place to put our new array (Student.plist)
		NSString *plistPath = [plistDC makePlistPathWithTitle:STUDENT_PLIST_TITLE];
		// Replace old plist with new one
		[updatedArray writeToFile:plistPath atomically:YES];

		
		// Make the delete look fancy instead of just reloading the table
		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}

#pragma mark - AddStudentViewControllerDelegate

-(void)didAddStudent:(Student *)student {

	// Add student sent from AddStudentView
	[plistDC addToPlistObject:student];
	// dismisses this view from the stack
	[self dismissViewControllerAnimated:YES completion:nil];
	// Refreshes the Main View to display the added Task object
	self.studentDataController = [[StudentDataController alloc] init];
	[self.tableView reloadData];
	
}

-(void)didCancel {
		[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addStudentBarButtonPressed:(UIBarButtonItem *)sender {
		[self performSegueWithIdentifier:@"toAddStudentViewSegue" sender:nil];
}
@end
