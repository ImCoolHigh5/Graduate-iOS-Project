//
//  SessionDataController.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "SessionDataController.h"
#import "Session.h"

@interface SessionDataController ()

@property (nonatomic, readonly) NSMutableArray *sessionList;

-(void) initializeDefaultSessions;

@end

@implementation SessionDataController

#pragma mark - Custom Initialization
// Initialization is overridden to make in instance something like an array
-(id) init {
	self = [super init];
	
	if(self) {
		_sessionList = [[NSMutableArray alloc] init];
		[self initializeDefaultSessions];
		return self;
	}
	return nil;
}

-(void) initializeDefaultSessions {
	
	NSArray *defaultSessionPList = [[NSArray alloc] initWithArray:
									[plistDC makeNSArrayFromPlistTitle:SESSION_PLIST_TITLE]];
	
	for (NSDictionary *sessionInfo in defaultSessionPList) {
		[_sessionList addObject:[self makeSessionFromNSDictionary:sessionInfo]];
	}
}

// The session list is kept private, but data can be accessed through the following methods
#pragma mark - Instance Methods

// how many sessions are there?
-(NSUInteger)sessionCount {
	return [self.sessionList count];
}

// which session is this??
-(Session *)sessionAtIndex:(NSUInteger)index {
	return [self.sessionList objectAtIndex:index];
}

#pragma mark - Helper Methods

-(Session*)makeSessionFromNSDictionary:(NSDictionary*)sessionInfo {
	Session *newSession = [[Session alloc]  initWithPlistDictionary:sessionInfo];
	
	return newSession;
	
}

#pragma mark - Class Methods

// If just creating an NSArray is easier...
+(NSArray*)getArrayOfSessions {
	
	// Since the class method does not have access to private instance properties
	NSMutableArray *sessionList = [[NSMutableArray alloc] init];
	
	// Use PlistDataController to create an array of dictionaries
	NSArray *defaultStudentPList = [[NSArray alloc] initWithArray:
									[plistDC makeNSArrayFromPlistTitle:SESSION_PLIST_TITLE]];
	
	// Cycle through each dictionary to convert to a session and add to our sessionList
	for (NSDictionary *sessionInfo in defaultStudentPList) {
  		
		// Use the Session instance to create a new object using the dictionary
  		Session *newSession = [[Session alloc]  initWithPlistDictionary:sessionInfo];
  		
		// And add that object to our sessionList
		[sessionList addObject:newSession];
	}
	
	// transer to an NSArray for better memory management
	// and send it on back full of Sessions from Session.plist
	NSArray *arrayOfSessions = [[NSArray alloc] initWithArray:sessionList];
	return arrayOfSessions;
}

@end
