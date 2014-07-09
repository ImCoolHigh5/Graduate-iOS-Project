//
//  MSCounty.m
//  Students
//
//  Created by Jason Welch on 7/8/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "MSCounty.h"
@interface MSCounty()

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDictionary *changesToCommonCore;

@end

@implementation MSCounty

+ (NSArray*)getCountyNames {
	NSArray *countyNames = @[
							 @"AAC",
							 @"BCO",
							 @"CITY",
							 @"CAL",
							 @"CARO",
							 @"CARR",
							 @"CEC",
							 @"CHR",
							 @"DCPS",
							 @"FRD",
							 @"HAR",
							 @"HOW",
							 @"MON",
							 @"PGC",
							 @"QUA",
							 @"WAS"
							 ];
	
	return countyNames;
}
/*
 for (int i = 0; i < [countyNames count]; i++) {
 
 [counties addObject:basicRequirements forKey:countyNames[i];]
 } */

- (id) initWithName:(NSString*)name {
	
	self = [super init];
	if (self) {
		self.name = name;
		[self makeRequirementChanges];
		return self;
	}
	return nil;
	
}

- (void) makeRequirementChanges {
	
	//	switch (self.name) {
	
	if ([self.name isEqualToString:@"AAC"]) {
		
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
									 @"MATH":	@4.0,
//									 @"PE":		@0.5,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@1.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"BCO"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
									 @"SS":		@3.5,
//									 @"SCI":	@3.0,
//									 @"MATH":	@3.0,
									 @"PE":		@1.0,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
//									 @"ELECTIVE":	@0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"CITY"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
//									 @"MATH":	@3.0,
//									 @"PE":		@0.5,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@1.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"CAL"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
									 @"MATH":	@4.0,
									 @"PE":		@1.0,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@1.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
									 @"FinancLit":	@0.5,
									 @"OTHER":	@1.0
									 };
	}
	else if ([self.name isEqualToString:@"CARO"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
//									 @"MATH":	@3.0,
									 @"PE":		@1.0,
									 @"HEALTH":	@1.0,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
									 @"CAREER":	@5.0,
//									 @"ELECTIVE":	@0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
									 @"OTHER":	@2.0
									 };
	}
	else if ([self.name isEqualToString:@"CARR"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
//									 @"MATH":	@3.0,
									 @"PE":		@1.0,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@4.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
									 @"FinancLit":	@0.5,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"CEC"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
									 @"SS":		@4.0,
//									 @"SCI":	@3.0,
									 @"MATH":	@4.0,
									 @"PE":		@1.0,
									 @"HEALTH":	@1.0,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@3.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"CHR"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
//									 @"MATH":	@3.0,
//									 @"PE":		@0.5,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@3.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
									 @"FinancLit":	@0.5,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"DSPS"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
									 @"SS":		@4.0,
									 @"SCI":	@4.0,
									 @"MATH":	@4.0,
									 @"PE":		@1.0,
//									 @"HEALTH":	@0.5,
									 @"TECH":	@0.0,
									 @"ART":	@0.5,
									 @"CAREER":	@2.0,
									 @"ELECTIVE":	@1.5,
									 @"MUSIC":	@0.5,
									 @"FLANG":	@2.0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"FRD"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
									 @"MATH":	@4.0,
//									 @"PE":		@0.5,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@1.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
									 @"FinancLit":	@0.5,
									 @"OTHER":	@2.5
									 };
	}
	else if ([self.name isEqualToString:@"HAR"]) {
#warning Career Completer
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
									 @"MATH":	@4.0,
									 @"PE":		@1.0,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@0.5, // Career Completer
//									 @"MUSIC":	@0,
									 @"FLANG":	@0, // Career Completer
//									 @"FinancLit":	@0,
									 @"OTHER":	@4.0 // Career Completer
									 };
	}
	else if ([self.name isEqualToString:@"HOW"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
//									 @"MATH":	@3.0,
//									 @"PE":		@0.5,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@1.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"MON"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
									 @"MATH":	@4.0,
									 @"PE":		@1.0,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@0.5,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"PGC"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
//									 @"MATH":	@3.0,
//									 @"PE":		@0.5,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@1.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"QUA"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
//									 @"MATH":	@3.0,
//									 @"PE":		@0.5,
//									 @"HEALTH":	@0.5,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@6.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else if ([self.name isEqualToString:@"WAS"]) {
		self.changesToCommonCore = @{
//									 @"ENG":	@4.0,
//									 @"SS":		@3.0,
//									 @"SCI":	@3.0,
									 @"MATH":	@4.0,
									 @"PE":		@1.0,
									 @"HEALTH":	@1.0,
//									 @"TECH":	@1.0,
//									 @"ART":	@1.0,
//									 @"CAREER":	@4.0,
									 @"ELECTIVE":	@2.0,
//									 @"MUSIC":	@0,
//									 @"FLANG":	@0,
//									 @"FinancLit":	@0,
//									 @"OTHER":	@0
									 };
	}
	else {
		NSLog(@"An invalid County was provided");
	}
}


-(NSNumber*) fixCountyRequirementForSubject:(NSString*)subjectKey {
	
	return [self.changesToCommonCore objectForKey:subjectKey];
	
}


@end
