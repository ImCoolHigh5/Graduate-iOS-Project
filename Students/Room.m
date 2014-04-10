//
//  Room.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Room.h"

@implementation Room

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

@end
