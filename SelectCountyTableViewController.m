//
//  SelectCountyTableViewController.m
//  Students
//
//  Created by Jason Welch on 7/8/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "SelectCountyTableViewController.h"
#import "MSCounty.h"

@interface SelectCountyTableViewController ()

@property (strong, nonatomic) NSArray *countyNames;

@end

@implementation SelectCountyTableViewController

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
	self.countyNames = [[NSArray alloc] initWithArray:[MSCounty getCountyNames]];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.countyNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	NSString *countyName = self.countyNames[indexPath.row];
	
	// Fills each row with a staff
	cell.textLabel.text = countyName;
	
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark - SelectCounty Delegation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Sets the county to be chosen
	[self.addCountyDelegate didSelectCounty:self.countyNames[indexPath.row]];
}
// If Disclosure Indicator is tapped instead
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	[self.addCountyDelegate didSelectCounty:self.countyNames[indexPath.row]];
	
}

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender {
	
	[self.addCountyDelegate didCancelCounty];
}

@end
