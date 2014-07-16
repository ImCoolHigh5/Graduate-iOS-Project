//
//  MSAcademicNeedsTableViewController.m
//  Students
//
//  Created by Jason Welch on 7/11/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "MSAcademicNeedsTableViewController.h"
#import "MSStudent.h"
#import "MSSubject.h"
#import "MSMasterSchedule.h"

@interface MSAcademicNeedsTableViewController ()

@property (nonatomic, strong) MSStudent *trialStudent;
@property (nonatomic, strong) NSMutableDictionary *updatedRequirements;
//@property (nonatomic, strong) NSDictionary *allNextRequiredCourseLabels;

@end

@implementation MSAcademicNeedsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	_trialStudent = [[MSStudent alloc] initWithStudentIDNumber:505
												  andFirstName:@"Paul"
												   andLastName:@"Dean"
												andAreTheyMale:YES
										  andHomeroomTeacherID:27
											andGuardianIDArray:nil
												 andScheduleID:16
													 andCounty:@"AAC"];
	[self setupView];
	
}

- (void) setupView {
	
	[self configureLabels];
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
	// Return the number of rows in the section.
	return 17;
}


#pragma mark - Helper Methods

- (void) configureLabels {
	
	NSDictionary *allCreditLabels = @{
									  @"ENG":		self.ENGCreditsLabel,
									  @"SS":		self.SSCreditsLabel,
									  @"SCI":		self.SCICreditsLabel,
									  @"MATH":		self.MATHCreditsLabel,
									  @"PE":		self.PECreditsLabel,
									  @"HEALTH":	self.HealthCreditsLabel,
									  @"TECH":		self.TECHCreditsLabel,
									  @"ART":		self.ARTCreditsLabel,
									  @"CAREER":	self.CAREERCreditsLabel,
									  @"ELECTIVE":	self.ELECTIVESCreditsLabel,
									  @"MUSIC":		self.MUSICreditsLabel,
									  @"FLANG":		self.FLANGCreditsLabel,
									  @"FinancLit":	self.FinanceCreditsLabel,
									  };
	for (NSString *subjectKey in allCreditLabels) {
		
		UILabel *thisCreditsLabel = allCreditLabels[subjectKey];
		thisCreditsLabel.text = [self setCreditLabelForSubjectKey:subjectKey];
	}
	
	NSDictionary *allNextRequiredCourseLabels = @{
												  @"ENG":		self.ENGNextRequiredCourseLabel,
												  @"SS":		self.SSNextRequiredCourseLabel,
												  @"SCI":		self.SCINextRequiredCourseLabel,
												  @"MATH":		self.MATHNextRequiredCourseLabel,
												  @"CAREER":	self.CAREERNextRequiredCourseLabel
												  };
	for (NSString *subjectKey in allNextRequiredCourseLabels) {
		
		UILabel *thisCourseLabel = allNextRequiredCourseLabels[subjectKey];
		thisCourseLabel.text = [self setNextClassLabelForSubjectKey:subjectKey];
	}
	
	NSDictionary *allPassedButtons = @{
									   @"ENG":		self.ENGPassedButton,
									   @"SS":		self.SSPassedButton,
									   @"SCI":		self.SCIPassedButton,
									   @"MATH":		self.MATHPassedButton,
									   @"CAREER":	self.CAREERPassedButton
									   };
	for (NSString *subjectKey in allPassedButtons) {
		
		UIButton *thisCourseButton = allPassedButtons[subjectKey];
		
		if ([self shouldHidePassedButtonForSubjectKey:subjectKey]) {
			thisCourseButton.hidden = YES;
		}
		else thisCourseButton.hidden = NO;
		
		MSSubject *thisSubject = self.trialStudent.requirements[subjectKey];
		if (thisSubject.creditsEarned >= thisSubject.creditsNeeded) {
			
			thisCourseButton.titleLabel.text = @"Elective";
		}
		else {
			thisCourseButton.titleLabel.text = @"Passed";
		}
	}
	
	NSDictionary *allMainUndoButtons = @{
										 @"ENG":		self.ENGUndoButton,
										 @"SS":		self.SSUndoButton,
										 @"SCI":		self.SCIUndoButton,
										 @"MATH":		self.MATHUndoButton,
										 @"CAREER":	self.CAREERUndoButton
										 };
	for (NSString *subjectKey in allMainUndoButtons) {
		
		UIButton *thisCourseButton = allMainUndoButtons[subjectKey];
		
		if ([self shouldHideUndoButtonForSubjectKey:subjectKey]) {
			thisCourseButton.hidden = YES;
		}
		else thisCourseButton.hidden = NO;
	}
}

- (BOOL) shouldHidePassedButtonForSubjectKey:(NSString*)subjectKey {
	
	MSMasterSchedule *masterSchedule = [[MSMasterSchedule alloc] init];
	NSArray *availableCourses = masterSchedule.offeredCourseLoad[subjectKey];
	MSSubject *thisSubject = self.trialStudent.requirements[subjectKey];
	int creditsEarned = thisSubject.creditsEarned;
	
	if ([availableCourses count] <= creditsEarned) {
		return YES;
	}
	else return NO;
}

- (BOOL) shouldHideUndoButtonForSubjectKey:(NSString*)subjectKey {
	
	MSSubject *thisSubject = self.trialStudent.requirements[subjectKey];
	int creditsEarned = thisSubject.creditsEarned;
	
	
	if (creditsEarned == 0) {
		return YES;
	}
	else return NO;
}

- (NSString*) setCreditLabelForSubjectKey:(NSString*)subjectKey {
	
	MSSubject *thisSubject = [[MSSubject alloc] init];
	thisSubject =  _trialStudent.requirements[subjectKey];
	
	return [NSString stringWithFormat:@"%.1f/%.0f", thisSubject.creditsEarned, thisSubject.creditsNeeded];
}

- (NSString*) setNextClassLabelForSubjectKey:(NSString*)subjectKey {
	
	MSMasterSchedule *masterSchedule = [[MSMasterSchedule alloc] init];
	NSArray *availableCourses = masterSchedule.offeredCourseLoad[subjectKey];
	MSSubject *thisSubject = self.trialStudent.requirements[subjectKey];
	int creditsEarned = thisSubject.creditsEarned;
	
	
	if ([availableCourses count] > creditsEarned) {
		Session *thisSession = availableCourses[creditsEarned];
		return thisSession.name;
	}
	else return @"All Courses Completed";
}

- (void) addToCredits:(float)credit forSubjectKey:(NSString*)subjectKey {
	
	MSSubject *thisSubject = self.trialStudent.requirements[subjectKey];
	thisSubject.creditsEarned += credit;
	self.trialStudent.totalCreditsEarned += credit;
	
	self.updatedRequirements = [[NSMutableDictionary alloc] initWithDictionary:self.trialStudent.requirements];
	
	if (thisSubject.creditsEarned > thisSubject.creditsNeeded) {
		MSSubject *electiveSubject = self.trialStudent.requirements[@"ELECTIVE"];
		electiveSubject.creditsEarned += credit;
		
		[self.updatedRequirements removeObjectForKey:@"ELECTIVE"];
		[self.updatedRequirements setObject:electiveSubject forKey:@"ELECTIVE"];
		self.trialStudent.requirements = self.updatedRequirements;
	}
	
	[self.updatedRequirements removeObjectForKey:subjectKey];
	[self.updatedRequirements setObject:thisSubject forKey:subjectKey];
	self.trialStudent.requirements = self.updatedRequirements;
	[self setupView];
	MyLog(@"%f credit(s) added to Subject:%@", credit, subjectKey);
}

- (void) removeCredits:(float)credit fromSubjectKey:(NSString*)subjectKey {
	
	MSSubject *thisSubject = self.trialStudent.requirements[subjectKey];
	if (thisSubject.creditsEarned > thisSubject.creditsNeeded) {
		MSSubject *electiveSubject = self.trialStudent.requirements[@"ELECTIVE"];
		electiveSubject.creditsEarned -= credit;
		
		[self.updatedRequirements removeObjectForKey:@"ELECTIVE"];
		[self.updatedRequirements setObject:electiveSubject forKey:@"ELECTIVE"];
		self.trialStudent.requirements = self.updatedRequirements;
	}
	
	thisSubject.creditsEarned -= credit;
	self.trialStudent.totalCreditsEarned -= credit;
	
	self.updatedRequirements = [[NSMutableDictionary alloc] initWithDictionary:self.trialStudent.requirements];
	[self.updatedRequirements removeObjectForKey:subjectKey];
	[self.updatedRequirements setObject:thisSubject forKey:subjectKey];
	self.trialStudent.requirements = self.updatedRequirements;
	[self setupView];
	MyLog(@"%f credit(s) removed to Subject: %@", credit, subjectKey);
}

- (void) undoCreditsForSubjectKey:(NSString*)subjectKey {
	
	MSSubject *thisSubject = self.trialStudent.requirements[subjectKey];
	float valueToBeRemoved = thisSubject.creditsEarned;
	thisSubject.creditsEarned = 0;
	self.trialStudent.totalCreditsEarned -= valueToBeRemoved;
	
	self.updatedRequirements = [[NSMutableDictionary alloc] initWithDictionary:self.trialStudent.requirements];
	[self.updatedRequirements removeObjectForKey:subjectKey];
	[self.updatedRequirements setObject:thisSubject forKey:subjectKey];
	self.trialStudent.requirements = self.updatedRequirements;
	
	MyLog(@"Credits undone for Subject: %@", subjectKey);
}

#pragma mark - IBActions

- (IBAction)ENGPassedButtonPressed:(UIButton *)sender{
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"ENG"];
}

- (IBAction)ENGUndoButtonPressed:(UIButton *)sender {
	
	[self removeCredits:1.0 fromSubjectKey:@"ENG"];
}

- (IBAction)SSPassedButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"SS"];
}
- (IBAction)SSUndoButtonPressed:(UIButton *)sender {
	
	[self removeCredits:1.0 fromSubjectKey:@"SS"];
}

- (IBAction)SCIPassedButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"SCI"];
}
- (IBAction)SCIUndoButtonPressed:(UIButton *)sender {
	
	[self removeCredits:1.0 fromSubjectKey:@"SCI"];
}

- (IBAction)MATHPassedButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"MATH"];
}
- (IBAction)MATHUndoButtonPressed:(UIButton *)sender {
	
	[self removeCredits:1.0 fromSubjectKey:@"MATH"];
}

- (IBAction)CAREERPassedButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"CAREER"];
}

- (IBAction)CAREERUndoButtonPressed:(UIButton *)sender {
	
	[self removeCredits:1.0 fromSubjectKey:@"CAREER"];
}

- (IBAction)OTHERUndoButtonPressed:(UIButton *)sender {
	
	[self undoCreditsForSubjectKey:@"MUSIC"];
	[self undoCreditsForSubjectKey:@"FLANG"];
	[self undoCreditsForSubjectKey:@"TECH"];
	[self undoCreditsForSubjectKey:@"PE"];
	[self undoCreditsForSubjectKey:@"ART"];
	[self undoCreditsForSubjectKey:@"HEALTH"];
	[self undoCreditsForSubjectKey:@"FinancLit"];
	[self setupView];
}

- (IBAction)MUSICButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"MUSIC"];
}
- (IBAction)FLANGButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"FLANG"];
}
- (IBAction)TECHButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"TECH"];
}
- (IBAction)PEButtonPressed:(UIButton *)sender  {
	
	[self addToCredits:0.5 forSubjectKey:(NSString*)@"PE"];
}
- (IBAction)ARTButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"ART"];
}
- (IBAction)HealthButtonPressed:(UIButton *)sender {
	
	[self addToCredits:0.5 forSubjectKey:(NSString*)@"HEALTH"];
}
- (IBAction)EconomicsButtonPressed:(UIButton *)sender {
	
	[self addToCredits:0.5 forSubjectKey:(NSString*)@"FinancLit"];
	
}
- (IBAction)FinancialLitButtonPressed:(UIButton *)sender {
	
	[self addToCredits:0.5 forSubjectKey:(NSString*)@"FinancLit"];
	
}

- (IBAction)ELECTIVESUndoButtonPressed:(UIButton *)sender {
	
	[self undoCreditsForSubjectKey:@"ELECTIVE"];
	
	[self setupView];
	
}
- (IBAction)MilitaryScienceButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"ELECTIVE"];
	
}
- (IBAction)BroadcastMediaButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"ELECTIVE"];
	
}
- (IBAction)LifeSkillsButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"ELECTIVE"];
	
}
- (IBAction)CrWritingButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"ELECTIVE"];
	
}
- (IBAction)GenPsychButtonPressed:(UIButton *)sender {
	
	[self addToCredits:1.0 forSubjectKey:(NSString*)@"ELECTIVE"];
	
}





/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
