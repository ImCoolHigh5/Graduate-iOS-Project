//
//  Student.m
//  Students
//
//  Created by Jason Welch on 2/23/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Student.h"
#import "ScheduleDataController.h"

@implementation Student

#pragma mark - Custom Initialization
// Initializing by passing each value
-(id) initWithStudentIDNumber:(int)studentIDNumber
				 andFirstName:(NSString*)firstName
				  andLastName: (NSString*) lastName
			   andAreTheyMale:(BOOL)isMale
		 andHomeroomTeacherID:(int) homeroomTeacherID
		   andGuardianIDArray:(NSArray*) guardianIDArray
				andScheduleID:(int) scheduleID
					andCounty:(NSString*) county{
	
	self = [super init];
    if (self) {
   		_studentIDNumber = studentIDNumber;
		_firstName = firstName;
        _lastName = lastName;
        _isMale = isMale;
		_homeroomTeacherID = homeroomTeacherID;
		_guardianIDArray = guardianIDArray;
		_scheduleID = scheduleID;
		_county = county;
        
        return self;
    }
    return nil;
}

#pragma mark - Helper Methods

// Converting bools into objects
-(NSString*)stringForIsMale {
	if (_isMale) {
		return @"YES";
	} else {
		return @"NO";
	}
}

#pragma mark - Data Reversion
// Transforms the Student instance into an NSDictionary object to upload
-(NSDictionary*)prepareForUpload {
    
	// First integers and bools must be turned into objects that the NSDictionary can work with
	NSNumber *studentIDNumber = [[NSNumber alloc] initWithInt:_studentIDNumber];
	NSString *isMale = [self stringForIsMale];
	NSNumber *homeroomTeacherID = [[NSNumber alloc] initWithInt:_homeroomTeacherID];
	NSNumber *scheduleID = [[NSNumber alloc] initWithInt:_scheduleID];
	
	// Each object is then put into an array in the same order as their keys, placed in another array
    NSArray *objects = [[NSArray alloc] initWithObjects:
						studentIDNumber, self.firstName, self.lastName, isMale, homeroomTeacherID, scheduleID, self.guardianIDArray, _county, nil];
	NSArray *keys = [[NSArray alloc] initWithObjects:
					 ID_NUMBER, FIRST_NAME, LAST_NAME, GENDER_IS_MALE, STAFF_ID_FOR_STUDENT, SCHEDULE_ID_FOR_STUDENT, GUARDIAN_ARRAY_FOR_STUDENT, COUNTY_FOR_STUDENT, nil];
	
	//These two arrays are used to make a new NSDictionary...
	NSDictionary *newStudentForPlist = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    
	// ...which is sent back to be used for uploading to a Plist
    return newStudentForPlist;
}

@end

#pragma mark Old Interface Code
// Removed mm-dd-yyyy


#pragma mark Old Implementation Code

// Removed 04-12-2014
//-(NSArray*)prepareForUploadTest {
//    // Create a dictionary with all the right keys
//	NSNumber *studentIDNumber = [[NSNumber alloc] initWithInt:_studentIDNumber];
//	NSString *isMale = [self stringForBool:_isMale];
//	NSNumber *homeroomTeacherID = [[NSNumber alloc] initWithInt:_homeroomTeacherID];
//	NSNumber *scheduleID = [[NSNumber alloc] initWithInt:_scheduleID];
//
//    NSMutableArray *objects = [[NSMutableArray alloc] initWithObjects:studentIDNumber, self.firstName, self.lastName, isMale, homeroomTeacherID, scheduleID, self.guardianIDArray, nil];
//	//	NSArray *keys = [[NSArray alloc] initWithObjects: ID_NUMBER, FIRST_NAME, LAST_NAME, GENDER_IS_MALE, STAFF_ID_FOR_STUDENT, SCHEDULE_ID_FOR_STUDENT, GUARDIAN_ARRAY_FOR_STUDENT, nil];
//	//	NSDictionary *newStudentForPlist = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
//
//    return objects;
//}




