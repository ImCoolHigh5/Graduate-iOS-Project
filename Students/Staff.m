//
//  Staff.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Staff.h"

@implementation Staff

#pragma mark - Custom Initialization
// Initializing by passing each value
-(id) initWithStaffIDNumber:(int)staffIDNumber
			   andFirstName:(NSString*)firstName
				andLastName: (NSString*) lastName
			 andAreTheyMale:(BOOL)isMale
		   andSubjectTaught:(NSString*) subject
				  andRoomID:(int) roomID
			  andScheduleID:(int) scheduleID {
	
	self = [super init];
    if (self) {
   		_staffIDNumber = staffIDNumber;
		_firstName = firstName;
        _lastName = lastName;
        _isMale = isMale;
		_subject = subject;
		_roomID = roomID;
		_scheduleID = scheduleID;
        
        return self;
    }
    return nil;
}

#pragma mark - Helper Methods
// Returns a full name with gender indicating prefix
-(NSString*)getFullName {
	
	NSString *staffPrefix = [[NSString alloc] init];
	if (self.isMale) {
		staffPrefix = @"Mr. ";
	} else {
		staffPrefix = @"Ms. ";
	}
	// to avoid nil errors with the return string
	if (!self.firstName) {
		self.firstName = @"";
	}
	if (!self.lastName) {
		self.lastName = @"";
	}
	
	return [NSString stringWithFormat:@"%@ %@ %@", staffPrefix, self.firstName, self.lastName];
}

// Might be better in PlistDataController
-(NSString*)stringForBool:(BOOL)boolValue {
	
	if (boolValue) {
		return @"YES";
	} else {
		return @"NO";
	}
	
}

#pragma mark - Data Reversion
// Transforms the Staff instance into an NSDictionary object to upload
-(NSDictionary *)prepareForUpload {
	
	// Must turn primatives into objects that the NSDictionary can work with
	NSNumber *staffIDNumber = [[NSNumber alloc] initWithInt:_staffIDNumber];
	NSString *isMale = [self stringForBool:_isMale];
	NSNumber *roomID = [[NSNumber alloc] initWithInt:_roomID];
	NSNumber *scheduleID = [[NSNumber alloc] initWithInt:_scheduleID];
	
	// Create keys and corisponding objects
	NSArray *keys = [[NSArray alloc] initWithObjects:
					 ID_NUMBER, FIRST_NAME, LAST_NAME, GENDER_IS_MALE, SUBJECT_TAUGHT, HOMEROOM_ID_FOR_STAFF, SCHEDULE_ID_FOR_STAFF, nil];
	NSArray *objects = [[NSArray alloc] initWithObjects:
						staffIDNumber, _firstName, _lastName, isMale, _subject, roomID, scheduleID, nil];
	
	// Fill the dictionary with the objects and their keys
	NSDictionary *newStaffForPlist = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
	
	// Return with a Dictionary item fit for a plist
	return newStaffForPlist;
}

@end
