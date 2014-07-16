//
//  MSStudent.m
//  Students
//
//  Created by Jason Welch on 7/8/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "MSStudent.h"
#import "MSSubject.h"
#import "MSCommonCore.h"


@implementation MSStudent

- (id) initWithStudentIDNumber:(int)studentIDNumber
				  andFirstName:(NSString*)firstName
				   andLastName: (NSString*) lastName
				andAreTheyMale:(BOOL)isMale
		  andHomeroomTeacherID:(int) homeroomTeacherID
			andGuardianIDArray:(NSArray*) guardianIDArray
				 andScheduleID:(int) scheduleID
					 andCounty:(NSString*) county {
	
	self = [super initWithStudentIDNumber:studentIDNumber
							 andFirstName:firstName
							  andLastName:lastName
						   andAreTheyMale:isMale
					 andHomeroomTeacherID:homeroomTeacherID
					   andGuardianIDArray:guardianIDArray
							andScheduleID:scheduleID
								andCounty:county];
	if (self) {
		
		[self setupRequirements];
		return self;
	}
	return nil;
}

//Create a new instance using the appropriate Dictionay
// An alternative to having the DataController handling the brunt of the work
-(id) initWithPlistDictionary:(NSDictionary*)entity {
	
	self = [super init];
	if (self) {
		if ([entity count] != 0) {
			
			self.studentIDNumber = [entity[ID_NUMBER] intValue];
			self.firstName = entity[FIRST_NAME];
			self.lastName = entity[LAST_NAME];
			self.isMale = [entity[GENDER_IS_MALE] boolValue];
			self.homeroomTeacherID = [entity[STAFF_ID_FOR_STUDENT] intValue];
			self.guardianIDArray = entity[GUARDIAN_ARRAY_FOR_STUDENT];
			self.scheduleID = [entity[SCHEDULE_ID_FOR_STUDENT] intValue];
			self.county = entity[COUNTY_FOR_STUDENT];
			
			[self setupRequirements];
			
			return self;
		}
	}
	return nil;
	
}

-(id) initWithStudentIDNumber:(int)studentIDNumber {
	
	self = [self initWithPlistDictionary:[plistDC getEntityWithIDNumber:studentIDNumber inPlist:MSSTUDENT_PLIST_TITLE]];
	
	if (self) {

		return self;
	}
	
	return nil;
}

#pragma mark - Helper Methods

- (void) setupRequirements {
	NSArray *subjectNames = @[
							  @"ENG",
							  @"SS",
							  @"SCI",
							  @"MATH",
							  @"PE",
							  @"HEALTH",
							  @"TECH",
							  @"ART",
							  @"CAREER",
							  @"ELECTIVE",
							  @"MUSIC",
							  @"FLANG",
							  @"FinancLit",
							  ];
	NSMutableDictionary *collectedSubjects = [[NSMutableDictionary alloc] init];
	for (NSString *name in subjectNames) {
		
		MSSubject *newSubject = [[MSSubject alloc] init];
		newSubject.name = name;
		[collectedSubjects setObject:newSubject forKey:name];
	}
	self.requirements = collectedSubjects;
	
	MSCommonCore *commonCore = [[MSCommonCore alloc] init];
	
	[commonCore adjustRequirementsForStudent:self];
	[self addEarnedCredtisFromPlist:MSSTUENT_REQUIREMENTS_PLIST_TITLE];
}

-(void) addEarnedCredtisFromPlist:(NSString*)sourceList {
	
	NSDictionary *thisStudentReqs = [plistDC getEntityWithIDNumber:self.studentIDNumber inPlist:sourceList];
	NSMutableDictionary *updatedRequirements = [[NSMutableDictionary alloc] init];
	
	if ([thisStudentReqs count] != 0) {
		
		NSMutableDictionary *theseRequirements = [[NSMutableDictionary alloc] initWithDictionary:self.requirements];
		for (NSString *subjectKey in theseRequirements) {
			
			MSSubject *thisSubject = [self.requirements objectForKey:subjectKey];
			float earnedCredits = [thisStudentReqs[subjectKey] floatValue];
			
			thisSubject.creditsEarned = earnedCredits;
			self.totalCreditsEarned += earnedCredits;
			
			[updatedRequirements setObject:thisSubject forKey:subjectKey];
		}
		

		self.requirements = updatedRequirements;
		
	}
	
}

-(int)gradeLevel {
	
	int ninthGrade = 0;
	int tenthGrade = 5;
	int eleventhGrade = 10;
	int twelfthGrade = 15;
	
	if (self.totalCreditsEarned >= twelfthGrade) {
		return 12; }
	else if (self.totalCreditsEarned >= eleventhGrade) {
		return 11; }
	else if (self.totalCreditsEarned >= tenthGrade) {
		return 10; }
	else if (self.totalCreditsEarned >= ninthGrade ) {
		return 9; }
	else
		return 0;
}

-(NSString*)printableGradeLevel {
	
	return [NSString stringWithFormat:@"%ith Grade", [self gradeLevel]];
}


@end
