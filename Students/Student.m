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

@end
