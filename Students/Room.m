//
//  Room.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Room.h"

@implementation Room

#pragma mark - Custom Initialization
// Initializing by passing each value
-(id) initWithRoomIDNumber:(int)roomIDNumber
				   andName:(NSString*)name
			andPhoneNumber: (NSString*) phoneNumber {
	
	self = [super init];
    if (self) {
		_roomIDNumber = roomIDNumber;
		_name = name;
		_phoneNumber = phoneNumber;
        
        return self;
    }
    return nil;
}

#pragma mark - Data Reversion
// Transforms the Guardian instance into an NSDictionary object to upload
-(NSDictionary *)prepareForUpload {
	
	// First primatives must be turned into objects that the NSDictionary can work with
	NSNumber *roomIDNumber = [[NSNumber alloc] initWithInt:_roomIDNumber];
	
	// Each object is then put into an array in the same order as their keys, placed in another array
	NSArray *keys = [[NSArray alloc] initWithObjects: ID_NUMBER, ROOM_NAME, ROOM_PHONE_NUMBER, nil];
	NSArray *objects = [[NSArray alloc] initWithObjects: roomIDNumber, _name, _phoneNumber, nil];
	
	// These two arrays are used to make a new NSDictionary...
	NSDictionary *newRoomForPlist = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
	
	// ...which is sent back to be used for uploading to a Plist
	return  newRoomForPlist;
}

@end
