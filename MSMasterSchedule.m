//
//  MSMasterSchedule.m
//  Students
//
//  Created by Jason Welch on 7/12/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "MSMasterSchedule.h"
#import "StudentDataController.h"
#import "MSStudent.h"
#import "MSSubject.h"

@interface MSMasterSchedule ()

@property (strong, nonatomic) NSString *subjectKey;
@property (strong, nonatomic) NSArray *classes;
@property (strong, nonatomic) NSArray *periods;

@end

@implementation MSMasterSchedule

// Makes a new session for the right name and period
- (Session*) makeSessionForPeriod:(int)period withTitle:(NSString*)title {
	
	Session *newSession = [[Session alloc] init];
	newSession.name = title;
	newSession.periodNumber = period;
	
	return newSession;
}

// Takes an array of class nanmes with a matching array of their periods and sets it to the designated subjectKey
- (void) addToCourseLoadTheSubject:(NSString*)subjectKey withClasses:(NSArray*)titles duringPeriods:(NSArray*)periods {
	
	NSMutableDictionary *newCourseLoad = [[NSMutableDictionary alloc] initWithDictionary:self.offeredCourseLoad];
	NSMutableArray *classes = [[NSMutableArray alloc] init];
	
	// Goes through each set and makes a Session for it
	for (int i = 0; i < [titles count]; i++) {
		
		Session *newSession = [[Session alloc] init];
		
		int thisPeriod = [periods[i] intValue];
		NSString *thisTitle = titles[i];
		
		newSession = [self makeSessionForPeriod:thisPeriod withTitle:thisTitle];
		[classes addObject:newSession];
	}
	
	[newCourseLoad setObject:classes forKey:subjectKey];
	self.offeredCourseLoad = newCourseLoad;
}

- (id)init
{
	self = [super init];
	if (self) {
		
		self.subjectKey = @"ENG";
		self.classes = @[
						 @"English 9: Exploring Literature 9",
						 @"English 10: World Literature",
						 @"English 11: American Literature",
						 @"English 12: British Literature"
						 ];
		self.periods = @[
						 @1,
						 @2,
						 @3,
						 @4
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"SS";
		self.classes = @[
						 @"Amer.Gov./Social Skills",
						 @"World History",
						 @"U.S. History",
						 @"World History II/DC Gov."
						 ];
		self.periods = @[
						 @3,
						 @4,
						 @5,
						 @2
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"SCI";
		self.classes = @[
						 @"Biology/Foundations of Writing",
						 @"Environmental Science",
						 @"Earth Science",
						 @"Chemistry"
						 ];
		self.periods = @[
						 @2,
						 @3,
						 @5,
						 @3
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"MATH";
		self.classes = @[
						 @"Algebriac Concepts",
						 @"Algebra",
						 @"Geometry",
						 @"Algebra II",
						 @"Probability & Statistics"
						 ];
		self.periods = @[
						 @4,
						 @5,
						 @7,
						 @8,
						 @3
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		
		self.subjectKey = @"PE";
		self.classes = @[
						 @"Physical Education I",
						 @"Physical Education II"
						 ];
		self.periods = @[
						 @7,
						 @2
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"HEALTH";
		self.classes = @[
						 @"Health",
						 @"Sexuality Education"
						 ];
		self.periods = @[
						 @8,
						 @8,
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"TECH";
		self.classes = @[
						 @"Foundations of Technology"
						 ];
		self.periods = @[
						 @2
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"ART";
		self.classes = @[
						 @"Art Fundamentals",
						 @"Advanced Art"
						 ];
		self.periods = @[
						 @1,
						 @3
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"CAREER";
		self.classes = @[
						 @"Career Survey",
						 @"Industry I",
						 @"Industry II",
						 @"Industry III",
						 @"Industry IV"
						 ];
		self.periods = @[
						 @5,
						 @7,
						 @8,
						 @1,
						 @1
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
#warning Electives need special treatment
		
		self.subjectKey = @"ELECTIVE";
		self.classes = @[
						 @"Intro to Broadcast Media",
						 @"Broadcast Media",
						 @"Military Science I",
						 @"Military Science II",
						 @"Life Skills",
						 @"Creative Writing",
						 @"General Psychology"
						 ];
		self.periods = @[
						 @1,
						 @3,
						 @2,
						 @3,
						 @3,
						 @2,
						 @1
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"MUSIC";
		self.classes = @[
						 @"Music Fundamentals"
						 ];
		self.periods = @[
						 @2
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"FLANG";
		self.classes = @[
						 @"Spanish I",
						 @"Spanish II"
						 ];
		self.periods = @[
						 @2,
						 @1
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
		self.subjectKey = @"FinancLit";
		self.classes = @[
						 @"Financial Literacy",
						 @"Economics"
						 ];
		self.periods = @[
						 @4,
						 @7
						 ];
		[self addToCourseLoadTheSubject:self.subjectKey withClasses:self.classes duringPeriods:self.periods];
		
	}
	return self;
}

- (void) configureScheduleForStudents:(NSArray*)studentIDs {
	for (NSString *subjectKey in self.offeredCourseLoad) { // cycle through subjects
		
		self.subjectKey = subjectKey;
		
		NSArray *classes = [self.offeredCourseLoad objectForKey:subjectKey];
		
		NSLog(@"\t%@ (%lu total classes):\n\n", subjectKey, (unsigned long)[classes count]);
		
		for (int i = 0; i < [classes count]; i++) { // cycle through sessions in a subject
			
			NSArray *unsortedstudentsNeedingThisSession = [self findStudentsNeedingSessionNumberInSequence:i inStudentIDs:studentIDs]; /*[[NSMutableArray alloc] initWithArray:*/
			
			NSArray *studentsNeedingThisSession = [self sortStudentsByDescendingCreditsEarned:unsortedstudentsNeedingThisSession];
			
			Session *thisSession = classes[i];
			NSLog(@"\tThe following students need to take %@ (%i of %lu):\n", thisSession.name, i+1, [classes count]);
			
			for (int num = 0; num < [studentsNeedingThisSession count]; num++) { //int studentID in studentsNeedingThisSession
				
				int studentID = [studentsNeedingThisSession[num] intValue];
				
				MSStudent *thisStudent =  [[MSStudent alloc] initWithStudentIDNumber:studentID];
				MSSubject *thisSubject = thisStudent.requirements[subjectKey];
				
				NSLog(@"\t%@, %@\t%.1f out of %.1f earned in this subject\t%.1f total credits earned (%@)\n",
					  thisStudent.lastName, thisStudent.firstName, thisSubject.creditsEarned, thisSubject.creditsNeeded, thisStudent.totalCreditsEarned, [thisStudent printableGradeLevel]);
			}
			NSLog(@"\n\n");
		}
		
		NSLog(@"\n\n\n");
	}
}

-(NSArray*) findStudentsNeedingSessionNumberInSequence:(int)i inStudentIDs:(NSArray*)studentIDs {
	
	NSMutableArray *studentsNeedingThisSession = [[NSMutableArray alloc] init];
	
	for (int num = 0; num < [studentIDs count]; num++) {
		
		NSNumber *studentID = studentIDs[num];
		
		MSStudent *thisStudent = [[MSStudent alloc] initWithStudentIDNumber:[studentID intValue]];
		MSSubject *thisSubject = thisStudent.requirements[self.subjectKey];
		
		if (thisSubject.creditsNeeded > thisSubject.creditsEarned) {
			int credits = thisSubject.creditsEarned;
			if (i == credits) {
				[studentsNeedingThisSession addObject:studentID];
			}
		}
	}
	NSArray *returnableArray = [[NSArray alloc] initWithArray:studentsNeedingThisSession];
	return returnableArray;
}

-(NSArray*) sortStudentsByDescendingCreditsEarned:(NSArray*)theseStudentIDs {
	
	NSMutableArray *descendingStudents = [[NSMutableArray alloc] init];
	
	while ([theseStudentIDs count] > 0) {
		
		NSNumber *biggestStudent = [self whoHasTheMostOf:theseStudentIDs];
		[descendingStudents addObject:biggestStudent];
		
		NSMutableArray *tempArray = [[NSMutableArray alloc] init];
		for (NSNumber *studentID in theseStudentIDs) {
			if (![studentID isEqualToNumber:biggestStudent]) {
				[tempArray addObject:studentID];
			}
		}
		theseStudentIDs = tempArray;
	}
	
	NSArray *returnableArray = [[NSArray alloc] initWithArray:descendingStudents];
	return returnableArray;
}

-(NSNumber*)whoHasTheMostOf:(NSArray*)theseStudentIDs {
	
	int biggest = 0;
	NSNumber *studentWithTheMost = [[NSNumber alloc] init];
	
	for (NSNumber *studentID in theseStudentIDs) {
		
		MSStudent *thisStudent = [[MSStudent alloc] initWithStudentIDNumber:[studentID intValue]];
		int totalCreds = thisStudent.totalCreditsEarned;
		
		if (totalCreds >= biggest) {
			biggest = totalCreds;
			studentWithTheMost = studentID;
		}
	}
	
	return studentWithTheMost;
}

@end
