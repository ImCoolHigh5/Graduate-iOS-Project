//
//  SelectAGuardianTableViewController.m
//  Students
//
//  Created by Jason Welch on 4/13/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "SelectAGuardianTableViewController.h"

@interface SelectAGuardianTableViewController ()

@property (nonatomic, strong) GuardianDataController *guardianDC;
@property (nonatomic, strong) Guardian *selectedGuardian;

@end

@implementation SelectAGuardianTableViewController

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
	
	// Fills each row with a guardian in a Last, First format
	NSString *fullName = [NSString stringWithFormat:@"%@, %@", guardian.lastName, guardian.firstName];
	cell.textLabel.text = fullName;
	
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

// If the user scrolls all the way down they can choose to create a new Guardian
- (IBAction)createNewGuardianPressed:(UIBarButtonItem *)sender {
	[self performSegueWithIdentifier:@"toNewGuardianSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// If we are seguing to the SelectAGuardianTableViewController...
	if ([segue.destinationViewController isKindOfClass:[NewGuardianViewController class]]) {
		NewGuardianViewController *createGuardian = segue.destinationViewController;
		createGuardian.createdGuardianDelegate = self;
	}
}

#pragma mark - SelectAGuardian Delegation
// Assigns selected Guardian to delegate for AddStudentView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Sets the guardian to be chosen
	self.selectedGuardian = [self.guardianDC guardianAtIndex:indexPath.row];
	[self.addGuardianDelegate didSelectGuardian:self.selectedGuardian];
	
}
// If the Disclosure Indicator is tapped instead
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	self.selectedGuardian = [self.guardianDC guardianAtIndex:indexPath.row];
	[self.addGuardianDelegate didSelectGuardian:self.selectedGuardian];
	
}

// Okay button was renamed to Cancel
- (IBAction)okayBarButtonPressed:(UIBarButtonItem *)sender {
	[self.addGuardianDelegate didCancelGuardian];
}


#pragma mark - NewGuardianViewController Delegates

-(void)didSelectNewGuardian:(Guardian *)createdGuardian {
	// Updates the Guardian list
	self.selectedGuardian  = createdGuardian;
	// dismisses this view from the stack

	[self.addGuardianDelegate didSelectGuardian:self.selectedGuardian];
		[self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCancelNewGuardian {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
