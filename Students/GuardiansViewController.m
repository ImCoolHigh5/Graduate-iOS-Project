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

@property (nonatomic, strong) GuardianDataController *guardianDC;

@end

@implementation GuardiansViewController


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

// Grouping isn't used
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
	
	// Fills each row with a student in a Last, First format
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

@end
