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
							  @"OTHER"
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
}


@end
