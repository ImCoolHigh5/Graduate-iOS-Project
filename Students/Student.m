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

-(id) initWithStudentIDNumber:(int)studentIDNumber
				 andFirstName:(NSString*)firstName
				  andLastName: (NSString*) lastName
			   andAreTheyMale:(BOOL)isMale
		 andHomeroomTeacherID:(int) homeroomTeacherID
		   andGuardianIDArray:(NSArray*) guardianIDArray
				andScheduleID:(int) scheduleID {
	
	self = [super init];
    if (self) {
   		_studentIDNumber = studentIDNumber;
		_firstName = firstName;
        _lastName = lastName;
        _isMale = isMale;
		_homeroomTeacherID = homeroomTeacherID;
		_guardianIDArray = guardianIDArray;
		_scheduleID = scheduleID;
        
        return self;
    }
    return nil;
	
}

// Prints all of the elements of a Student to NSLog
-(void) printStudent {
	// Since BOOL is primitave, we need to convert _isMale to an NSString
	NSString *maleOrNo = [self stringForBool:_isMale];
//	if (_isMale) {
//		maleOrNo = @"YES";
//	} else {
//		maleOrNo = @"NO";
//	}
    NSLog(@"\n FirstName: %@ \n LastName: %@ \n IsMale: %@ \n StaffID: %d \n ScheduleID: %d \n GuardianID(s): %@", _firstName, _lastName, maleOrNo, _homeroomTeacherID, _scheduleID, _guardianIDArray);
}

#warning prepareForUpload should be created for all Entity Objects
-(NSDictionary*)prepareForUpload {
    // Create a dictionary with all the right keys
	NSNumber *studentIDNumber = [[NSNumber alloc] initWithInt:_studentIDNumber];
	NSString *isMale = [self stringForBool:_isMale];
	NSNumber *homeroomTeacherID = [[NSNumber alloc] initWithInt:_homeroomTeacherID];
	NSNumber *scheduleID = [[NSNumber alloc] initWithInt:_scheduleID];
	
    NSMutableArray *objects = [[NSMutableArray alloc] initWithObjects:studentIDNumber, self.firstName, self.lastName, isMale, homeroomTeacherID, scheduleID, self.guardianIDArray, nil];
	NSArray *keys = [[NSArray alloc] initWithObjects: ID_NUMBER, FIRST_NAME, LAST_NAME, GENDER_IS_MALE, STAFF_ID_FOR_STUDENT, SCHEDULE_ID_FOR_STUDENT, GUARDIAN_ARRAY_FOR_STUDENT, nil];
	NSDictionary *newStudentForPlist = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    
    return newStudentForPlist;
}

-(NSArray*)prepareForUploadTest {
    // Create a dictionary with all the right keys
	NSNumber *studentIDNumber = [[NSNumber alloc] initWithInt:_studentIDNumber];
	NSString *isMale = [self stringForBool:_isMale];
		NSNumber *homeroomTeacherID = [[NSNumber alloc] initWithInt:_homeroomTeacherID];
		NSNumber *scheduleID = [[NSNumber alloc] initWithInt:_scheduleID];
	
    NSMutableArray *objects = [[NSMutableArray alloc] initWithObjects:studentIDNumber, self.firstName, self.lastName, isMale, homeroomTeacherID, scheduleID, self.guardianIDArray, nil];
//	NSArray *keys = [[NSArray alloc] initWithObjects: ID_NUMBER, FIRST_NAME, LAST_NAME, GENDER_IS_MALE, STAFF_ID_FOR_STUDENT, SCHEDULE_ID_FOR_STUDENT, GUARDIAN_ARRAY_FOR_STUDENT, nil];
//	NSDictionary *newStudentForPlist = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    
    return objects;
}

-(NSString*)stringForBool:(BOOL)boolValue {
	
	if (boolValue) {
		return @"YES";
	} else {
		return @"NO";
	}
	
}

@end
