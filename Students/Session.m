//
//  Session.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Session.h"

@implementation Session

#pragma mark - Custom Initialization
// Initializing by passing each value
-(id) initWithSessionIDNumber:(int)sessionIDNumber
					  andName:(NSString*)name
					andRoomID:(int) roomID
				   andStaffID:(int) staffID
			  andPeriodNumber:(int) periodNumber {
	
	self = [super init];
    if (self) {
		_sessionIDNumber = sessionIDNumber;
		_name = name;
		_roomID = roomID;
		_staffID = staffID;
		_periodNumber = periodNumber;
        
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
			
			_sessionIDNumber = [entity[ID_NUMBER] intValue];
			_name = entity[SESSION_NAME];
			_roomID = [entity[ROOM_SESSION_HELD_IN_ID] intValue];
			_staffID = [entity[STAFFING_ID_FOR_SESSION] intValue];
			_periodNumber = [entity[SESSION_PERIOD_NUMBER] intValue];
			return self;
		}
    }
    return nil;
	
}

#pragma mark - Data Reversion

-(NSDictionary *)prepareForUpload {

	// Must turn primatives into objects
	NSNumber *sessionIDNumber = [[NSNumber alloc] initWithInt:_sessionIDNumber];
	NSNumber *roomID = [[NSNumber alloc] initWithInt:_roomID];
	NSNumber *staffID = [[NSNumber alloc] initWithInt:_staffID];
	NSNumber *periodNumber = [[NSNumber alloc] initWithInt:_periodNumber];
	
	// Create keys and corisponding objects
	NSArray *keys = [[NSArray alloc] initWithObjects:
					 ID_NUMBER, SESSION_NAME, ROOM_SESSION_HELD_IN_ID, STAFFING_ID_FOR_SESSION, SESSION_PERIOD_NUMBER, nil];
	NSArray *objects = [[NSArray alloc] initWithObjects:
						sessionIDNumber, _name, roomID, staffID, periodNumber, nil];
	
	// Fill the dictionary with the objects and their keys
	NSDictionary *newSessionForPlist = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
	
	// Return with a Dictionary item fit for a plist
	return newSessionForPlist;

}
@end
