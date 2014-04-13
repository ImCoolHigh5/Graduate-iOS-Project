//
//  GuardiansViewController.m
//  Students
//
//  Created by Jason Welch on 4/9/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "GuardiansViewController.h"
#import "GuardianDataController.h"
#import "Guardian.h"

@interface GuardiansViewController ()

@property (nonatomic, strong) NSArray *guardians;

@end

@implementation GuardiansViewController
// Assigns selected Student object from preview view
- (void)setSelectedStudent:(id)newDetailItem
{
    if (_selectedStudent != newDetailItem) {
        _selectedStudent = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
	// Update the user interface for the detail item.
	
	if (self.selectedStudent) {
		_guardians = [GuardianDataController getGuardiansForStudentWithGuardianIDArray:_selectedStudent.guardianIDArray];
		
	}
}

- (void)awakeFromNib
{
    [super awakeFromNib];
	self.guardianDC = [[GuardianDataController alloc] init];
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

// Returns number of guardian items to be displayed
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// take a count of the internal schedule array
	return [_guardians count];
}

// This may need to be more extensive but for now there room for Gender First Last, Phone number, house# and street, and City State Zipcode
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 5;
}

// Loads the cells into the sections
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

	Guardian *guardianItem = [_guardians objectAtIndex:indexPath.section]; // Guardian object used for this section
	// Strings for BOOLS used to make titles (Main Contact / Emergency Contact / Resident)
	NSString *isMain = [[NSString alloc] initWithSttring:@""];
	NSString *isEmergency = [[NSString alloc] initWithSttring:@""];
	NSString *isResident = [[NSString alloc] initWithSttring:@""];
	BOOL slashNeeded = NO; // Is a Main/Emergency and Resident
	
	if (guardianItem.isMainContact) {
		isMain = @"Main Contact ";
		slashNeeded = YES;
	} else if (guardianItem.isEmergencyContact) {
		isEmergency = @"Emergency Contact ";
		slashNeeded = YES;
	}
	if (guardianItem.isMainContact && guardianItem.isEmergencyContact) {
		return nil;
	}
	if (guardianItem.isResidenceOfStudent ) {
		if (slashNeeded) {
			isResident = @"/ Resident"
		} else isResident = @"Resident"
	NSString *sectionName = [[NSString alloc] init];
	
	sectionName = [NSString stringWithFormat:@"%@%@%@", isMain, isEmergency, isResident];


	return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

	// Makes a new guardianItem from the student's guardianIDArray at the index specified by the tableView
	Guardian *guardianItem = [_guardians objectAtIndex:indexPath.section];

	NSString *cellTitle = [[NSString alloc] init];
	NSString *namePrefix = [[NSString alloc] initWithString:[self stringForGender:guardianItem.isMale]];
	// Tests to see which element needs to be pulled, depending on the cell in this section
	// Assumes only five cells are needed per section
	switch (indexPath.row) {
		case 0:
			cellTitle = [NSString stringWithFormat:@"%@ %@ %@", namePrefix, guardianItem.firstName, guardianItem.lastName];
			break;
		case 1:
			cellTitle = [NSString stringWithFormat:@"Phonenumber: %@", guardianItem.phoneNumber];
			break;
		case 2:
			cellTitle = [NSString stringWithFormat:@"%Address:", guardianItem.houseNumber, guardianItem.street];
			break;	
		case 3:
			cellTitle = [NSString stringWithFormat:@"%@ %@", guardianItem.houseNumber, guardianItem.street];
			break;
		case 4:
			cellTitle = [NSString stringWithFormat:@"%@, %@ %i", guardianItem.city, guardianItem.state, guardianItem.zipCode];
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

// To indicate gender withouth the need for an extra line
-(NSString*)stringForGender:(BOOL)isMale {

	if (isMale) {
		return @"Mr.";
	} else {
		return @"Ms.";
	}

}


/* // Grouping isn't used
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.guardianDC guardianCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	
	Guardian *guardian = [self.guardianDC guardianAtIndex:indexPath.row];
	
	// Fills each row with a guardian in a Last, First format
	NSString *fullName = [NSString stringWithFormat:@"%@, %@", guardian.lastName, guardian.firstName];
	cell.textLabel.text = fullName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

// Sends the selected Student object to the StudentMenuView
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"ShowStudentMenu"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//		Student *student = [self.studentDataController studentAtIndex:indexPath.row];
//        [[segue destinationViewController] setSelectedStudent:student];
//    }
//}
*/
@end
