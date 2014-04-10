//
//  Session.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Session.h"

@implementation Session

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


@end
