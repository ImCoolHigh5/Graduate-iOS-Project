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
				 andStaffID:(int) staffID {
	
	self = [super init];
    if (self) {
		_sessionIDNumber = sessionIDNumber;
		_name = name;
		_roomID = roomID;
		_staffID = staffID;
        
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
			
			_sessionIDNumber = [entity[@"idNumber"] intValue];
			_name = entity[@"name"];
			_roomID = [entity[@"roomID"] intValue];
			_staffID = [entity[@"staffID"] intValue];
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
	
	// Create keys and corisponding objects
	NSArray *keys = [[NSArray alloc] initWithObjects:
					 ID_NUMBER, SESSION_NAME, ROOM_SESSION_HELD_IN_ID, STAFFING_ID_FOR_SESSION, nil];
	NSArray *objects = [[NSArray alloc] initWithObjects:
						sessionIDNumber, _name, roomID, staffID, nil];
	
	// Fill the dictionary with the objects and their keys
	NSDictionary *newSessionForPlist = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
	
	// Return with a Dictionary item fit for a plist
	return newSessionForPlist;

}
@end
