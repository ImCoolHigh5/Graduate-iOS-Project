//
//  Staff.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Staff.h"

@implementation Staff


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

@end
