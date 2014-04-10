//
//  StaffDataController.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Staff;

@interface StaffDataController : NSObject

-(NSUInteger)staffCount;

-(Staff*)staffAtIndex: (NSUInteger)index;

-(void) addStaffWithStaffIDNumber:(int)staffIDNumber
					 andFirstName:(NSString*)firstName
					  andLastName: (NSString*) lastName
				   andAreTheyMale:(BOOL)isMale
				 andSubjectTaught:(NSString*) subject
					andRoomID:(int) roomID
					andScheduleID:(int) scheduleID;

+(NSString*)getStaffNameWithID:(int)staffID;

@end
