//
//  SessionDataController.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "SessionDataController.h"

@interface SessionDataController : NSObject

@property (nonatomic, readonly) NSMutableArray *sessionList;

-(void) initializeDefaultSessions;

@end

@implementation SessionDataController

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
	//NSString *pathToStudentPList = [[NSBundle mainBundle] pathForResource:STUDENT_PLIST_TITLE ofType:@"plist"];
	NSArray *defaultSessionPList = [[NSArray alloc] initWithArray [plistDC makeNSArrayFromPlistTitle:SESSION_PLIST_TITLE]];
	for (NSDictionary *sessionInfo in defaultSessionPList) {
		[_sessionList addObject:[self makeSessionFromNSDictionary:sessionInfo]];
	}
}

-(Session*)makeSessionFromNSDictionary:(NSDictionary*)sessionInfo {
	Session *newSession = [[Session alloc]  initWithPlistDictionary:sessionInfo;

	return newSession;

}

// If just creating an NSArray is easier...
+(NSArray*)getArrayOfSessions {
	// Since the class method does not have access to private instance properties
	NSMutableArray *sessionList = [[NSMutableArray alloc] init];
	// Use PlistDataController to create an array of dictionaries
	NSArray *defaultStudentPList = [[NSArray alloc] initWithArray [plistDC makeNSArrayFromPlistTitle:SESSION_PLIST_TITLE]];
	// Cycle through each dictionary to convert to a session and add to our sessionList
	for (NSDictionary *sessionInfo in defaultStudentPList) {
  		// Use the Session instance to create a new object using the dictionary
  		Session *newSession = [[Session alloc]  initWithPlistDictionary:sessionInfo;
  		// And add that object to our sessionList
		[sessionList addObject:newSession;
	}
	// transer to an NSArray for better memory management
	NSArray *arrayOfSessions = [[NSArray alloc] initWithArray:sessionList];
	// and send it on back full of Sessions from Session.plist
	return arrayOfSessions;
}

// how many students are there?
-(NSUInteger)sessionCount {
return [self.sessionList count];
}

// which student is this??
-(Session *)sessionAtIndex:(NSUInteger)index {
return [self.sessionList objectAtIndex:index];
}

#warning Add period property to Sessions
-(void)printSessionIDsWithTheirPeriodNumbers {
	
	NSArray *scheduleIDs = [[NSArray alloc] initWithArray:[plistDC getIDsFromPlist:SCHEDULE_PLIST_TITLE]];
	for (int i =0; i < [scheduleIDs count]; i++) {
		NSArray *thisSchedule = [[NSArray alloc] initWithArray:[ScheduleDataController createScheduleForScheduleID:[scheduleIDs[i] intValue]];
		for (int i =0; i < [thisSchedule count]; i++) {
			ScheduleItem *thisScheduleItem = [[ScheduleItem alloc] init];
			thisScheduleItem = thisSchedule[i];
	}
}
@end
