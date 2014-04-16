//
//  Staff.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

// Now modeled after to properties from a "Staff.plist" entity

#import <Foundation/Foundation.h>

@interface Staff : NSObject

#pragma mark - Public Properties

@property (nonatomic, assign) int staffIDNumber;
@property (nonatomic, copy) NSString* firstName;
@property (nonatomic, copy) NSString* lastName;
@property (nonatomic, assign) BOOL isMale;
@property (nonatomic, copy) NSString* subject;
@property (nonatomic) int roomID;
@property (nonatomic) int scheduleID;

#pragma mark - Public Methods

-(id) initWithStaffIDNumber:(int)staffIDNumber
			   andFirstName:(NSString*)firstName
				andLastName: (NSString*) lastName
			 andAreTheyMale:(BOOL)isMale
		   andSubjectTaught:(NSString*) subject
			  andRoomID:(int) roomID
			  andScheduleID:(int) scheduleID;

// Returns a full name with gender indicating prefix
-(NSString*)getFullName;

@end
