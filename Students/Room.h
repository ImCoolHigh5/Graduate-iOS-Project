//
//  Room.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

// Now modeled after to properties from a "Room.plist" entity

#import <Foundation/Foundation.h>

@interface Room : NSObject

@property (nonatomic, assign) int roomIDNumber;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* phoneNumber;


-(id) initWithRoomIDNumber:(int)roomIDNumber
				   andName:(NSString*)name
			andPhoneNumber: (NSString*) phoneNumber;
@end
