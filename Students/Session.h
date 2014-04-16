//
//  Session.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

// Now modeled after to properties from a "Session.plist" entity
#import <Foundation/Foundation.h>

@interface Session : NSObject

#pragma mark - Public Properties

@property (nonatomic, assign) int sessionIDNumber;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) int roomID;
@property (nonatomic, assign) int staffID;
@property (nonatomic, assign) int periodNumber;

#pragma mark - Public Methods

-(id) initWithSessionIDNumber:(int)sessionIDNumber
				 andName:(NSString*)name
				andRoomID:(int) roomID
				 andStaffID:(int) staffID
			  andPeriodNumber:(int) periodNumber;

// Used to pull a specific Session from the Plist and assign the correct properties
-(id) initWithPlistDictionary:(NSDictionary*)entity;
@end
