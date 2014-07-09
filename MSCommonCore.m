//
//  MSCommonCore.m
//  Students
//
//  Created by Jason Welch on 7/8/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "MSCommonCore.h"
#import "MSStudent.h"
#import "MSSubject.h"
#import "MSCounty.h"

@interface MSCommonCore()

@property (strong, nonatomic) NSDictionary *requirements;

@end

@implementation MSCommonCore

- (id) init {
	
	self = [super init];
	if (self) {
		[self setCommonCoreRequirements];
		return self;
	}
	return nil;
	
}

- (void) setCommonCoreRequirements{
	
	self.requirements = @{
						  @"ENG":		@4.0,
						  @"SS":		@3.0,
						  @"SCI":		@3.0,
						  @"MATH":		@3.0,
						  @"PE":		@0.5,
						  @"HEALTH":	@0.5,
						  @"TECH":		@1.0,
						  @"ART":		@1.0,
						  @"CAREER":	@4.0,
						  @"ELECTIVE":	@0.0,
						  @"MUSIC":		@0.0,
						  @"FLANG":		@0.0,
						  @"FinancLit":	@0.0,
						  @"OTHER":		@0.0,
						  };
}

- (MSStudent*) adjustRequirementsForStudent:(MSStudent*)student {
	
	if (student.county) {
		NSMutableDictionary *updatedRequirements = [[NSMutableDictionary alloc] init];
		
		student.totalCreditsNeeded = 0.0;
		
		// adds each subject in the dictionary with county updates
		for (NSString *subjectKey in student.requirements) {
			
			MSSubject *subject = [[MSSubject alloc] init];
			subject = [student.requirements objectForKey:subjectKey];
			
			// Assumes subject.name = self.requirements key
			NSNumber *updatedValue = [[NSNumber alloc] init];
			
			MSCounty *thisCounty = [[MSCounty alloc] initWithName:student.county];
			
			updatedValue = [thisCounty fixCountyRequirementForSubject:subject.name];
			NSString *subjectKey = [[NSString alloc] initWithString:subject.name];
			float neededCredits;
			
			if (updatedValue) {
				
				neededCredits = [updatedValue floatValue];
			}
			else {
				
				neededCredits = [self.requirements[subjectKey] floatValue];
			}
			
			subject.creditsNeeded = neededCredits;
			student.totalCreditsNeeded += [updatedValue floatValue];
			
			[updatedRequirements setObject:subject forKey:subjectKey];
		}
		
		student.requirements = updatedRequirements;
		return student;
	}
	else {
		
		NSLog(@"No County!!!");
		return nil;
	}
}


@end
