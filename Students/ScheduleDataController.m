//
//  ScheduleDataController.m
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "ScheduleDataController.h"
#import "ScheduleItem.h"
#import "Session.h"
#import "StaffDataController.h"
#import "Schedule.h"


@interface ScheduleDataController ()

@property (nonatomic, readonly) NSMutableArray *scheduleList;

@end

@implementation ScheduleDataController


#pragma mark - Class Methods

// The schedule view is currently handled by this method (and its helper) alone
// Using the scheduleID number of a Student/Staff property, an Array of schedule items is assembled
+(NSArray*)createScheduleForScheduleID:(int)idNumber {
	
	// To be be filled with ScheduleItem objects
	NSMutableArray *scheduleItems = [[NSMutableArray alloc] init];
	
	// uses the Schedule ID number passed to find the coorsponding schedule in the "Schedule.plist"
	NSDictionary *scheduleFromPlist = [[NSDictionary alloc] initWithDictionary:
									   [plistDC getEntityWithIDNumber:idNumber
															  inPlist:SCHEDULE_PLIST_TITLE]];
	
	// Creates the number of Sessions in a given day,
	// accouting for the extra properties of a Schedule object (idNumber and personID)
	int totalSessions = (int)[scheduleFromPlist count];
	totalSessions -= 2;
	
	ScheduleItem* newItem = [[ScheduleItem alloc] init]; // Will be reused to fill the array
	
	// Using the sessionID stored in each Schedule item, we can gather up the information needed to display a schedule
	for (int i = 0; i < totalSessions; i++) {
		if (i == 0) {
			//amHomeroom
			newItem = [self getScheduleItemWithSessionID:[scheduleFromPlist[AM_HOMEROOM_SESSION_ID] intValue]];
			
		} else if (i == (totalSessions-1)) {
			//pmHomeroom
			newItem = [self getScheduleItemWithSessionID:[scheduleFromPlist[PM_HOMEROOM_SESSION_ID] intValue]];
			
		} else {
			// periods
			#warning Using the current count as the period name
			// ...since it currently matches up as such
			NSString *periodName = [[NSString alloc] initWithString:[NSString stringWithFormat:@"period%i", i]];
			
			newItem = [self getScheduleItemWithSessionID:[scheduleFromPlist[periodName] intValue]];
		}
		
		// The for loop count is used to assign the period property
		newItem.period = i;
		
		// This newly created ScheduleItem is added to to mutable array
		[scheduleItems addObject:newItem];
	}
	
	// The completed collection of ScheduleItem objects is put into an array
	// for memory conservation and returned
	NSArray *toBeReturned = [[NSArray alloc] initWithArray:scheduleItems];
	return toBeReturned;
}

// Returns an array of Schedule objects, holding the reference idNumbers stored in the Plist
+(NSArray*)getArrayOfSchedules {
	
	// Since the class method does not have access to private instance properties
	NSMutableArray *scheduleList = [[NSMutableArray alloc] init];
	
	// Use PlistDataController to create an array of dictionaries
	NSArray *defaultSchedulePList = [[NSArray alloc] initWithArray:[plistDC makeNSArrayFromPlistTitle:
																	SCHEDULE_PLIST_TITLE]];
	
	// Cycle through each dictionary to convert to a Schedule and add to our scheduleList
	for (NSDictionary *scheduleInfo in defaultSchedulePList) {
		
		// Use the Schedule instance to create a new object using the dictionary
		// and add that object to our sessionList
		Schedule *newSchedule = [[Schedule alloc]initWithPlistDictionary:scheduleInfo];
		[scheduleList addObject:newSchedule];
	}
	
	// Transer to an NSArray for better memory management
	// and send it on back full of Sessions from Session.plist
	NSArray *arrayOfSessions = [[NSArray alloc] initWithArray:scheduleList];
	return arrayOfSessions;
}

#pragma mark - Helper Methods

// Used in createScheduleForScheduleID: to make Schedule items from session reference numbers
+(ScheduleItem*)getScheduleItemWithSessionID:(int)idNumber {
	
	// Our returnable object
	ScheduleItem* newItem = [[ScheduleItem alloc] init];
	
	// The PlistDataController returns a NSDictionary matching the Entity specified, which in this case is a Session.
	// This is nested in a custom init allowing you to transform the NSDictionary into a Session object
	Session *newSession = [[Session alloc] initWithPlistDictionary:
						   [plistDC getEntityWithIDNumber:idNumber
												  inPlist:SESSION_PLIST_TITLE]];
	
	// Properties are assigned using the Session information
	newItem.name = newSession.name;
	
	// The method getStaffNameWithID: dynamically creates a string for the staff name,
	// avoiding the creation of a complex Staff object
	newItem.teacher = [StaffDataController getStaffNameWithID:newSession.staffID];
	
	// The PlistDataController is enlisted to avoid the need to import Room.h
	newItem.roomNumber = [plistDC getValueUsingKeyValue:ROOM_NAME
								  forEntityWithIDNumber:newSession.roomID
												inPlist:ROOM_PLIST_TITLE];
	return newItem;
}

// Creates a new Schedule object from methods passed to it, using the Schedule custom init
-(Schedule*)makeScheduleFromNSDictionary:(NSDictionary*)scheduleInfo {
	
	// Using this custom init of the Schedule object, this method is greatly simplified
	Schedule *newSchedule = [[Schedule alloc]  initWithPlistDictionary:scheduleInfo];
	
	return newSchedule;
}

#pragma mark - Custom Initialization
// Initialization is overridden to make in instance something like an array
-(id) init {
	self = [super init];
	
	if(self) {
		_scheduleList = [[NSMutableArray alloc] init];
		[self initializeDefaultSchedules];
		return self;
	}
	return nil;
}

-(void) initializeDefaultSchedules {
	NSArray *defaultSchedulePList = [[NSArray alloc] initWithArray:[plistDC makeNSArrayFromPlistTitle:
																	SCHEDULE_PLIST_TITLE]];
	for (NSDictionary *scheduleInfo in defaultSchedulePList) {
		[_scheduleList addObject:[self makeScheduleFromNSDictionary:scheduleInfo]];
	}
}

// The schedule list is kept private, but data can be accessed through the following methods
#pragma mark - Instance Methods

// How many sessions are there?
-(NSUInteger)scheduleCount {
	return [self.scheduleList count];
}

// Which Schedule is this?
-(Schedule *)scheduleAtIndex:(NSUInteger)index {
	return [self.scheduleList objectAtIndex:index];
}

#pragma mark Old Interface Code
// Removed mm-dd-yyyy
/****** Old way *******
 // Used to fill with ScheduleItems, no matter how many there are
 @property (nonatomic, readonly) NSMutableArray *scheduleItemList;
 
 ****** Old way *******/

#pragma mark Old Implementation Code
// Removed mm-dd-yyyy
/****** Old way *******
 // Creates an array of schedule items belonging to the StudentIDNumber passed
 -(id) initWithStudentIDNumber:(int)studentIDNumber {
 
 self = [super init];
 
 if(self) {
 _scheduleItemList = [[NSMutableArray alloc] init];
 [self initializeScheduleItemsForStudent:studentIDNumber];
 
 // After the list is filled with however many ScheduleItems, they are placed in a mutable array to be retained
 _studentSchedule = _scheduleItemList;
 //		[self printScheduleToLog:_scheduleItemList];
 return self;
 }
 return nil;
 }
 
 // Looks in the array of items in the ScheduleItems.plist at the index of the student number, and converts its array (ScheduleItems) full of dictionaries (properties)
 -(void) initializeScheduleItemsForStudent:(int)studentIDNumber {
 NSString *pathToSchdeuleItemPList = [[NSBundle mainBundle] pathForResource:@"ScheduleItems" ofType:@"plist"];
 NSArray *defaultScheduleItemsPList = [NSArray arrayWithContentsOfFile:pathToSchdeuleItemPList];
 NSArray *scheduleItemsForStudent =[defaultScheduleItemsPList objectAtIndex:(NSUInteger)studentIDNumber];
 for (NSDictionary *scheduleItemInfo in scheduleItemsForStudent) {
 // Uses each dictionary to create a ScheduleItem and add it to the scheduleItemList
 [self addScheduleItemWithPeriod:[scheduleItemInfo[@"Period"] intValue]
 name:scheduleItemInfo[@"Name"]
 teacher:scheduleItemInfo[@"Teacher"]
 roomNumber:scheduleItemInfo[@"RoomNumber"]];
 }
 }
 
 -(void) addScheduleItemWithPeriod:(int)aPeriod
 name:(NSString*)aName
 teacher:(NSString*)aTeacher
 roomNumber:(NSString*)aRoomNumber {
 
 ScheduleItem *newScheduleItem = [[ScheduleItem alloc] initWithPeriod:(int)aPeriod name:(NSString*)aName teacher:(NSString*)aTeacher roomNumber:(NSString*)aRoomNumber];
 [self.scheduleItemList addObject:newScheduleItem];
 }
 
 // Used to know exactly how many periods are in this school day
 -(NSUInteger)scheduleItemCount {
 return [self.scheduleItemList count];
 }
 
 -(ScheduleItem *)scheduleItemAtIndex: (NSUInteger)index {
 return [self.studentSchedule objectAtIndex:index];
 }

 ****** Old way *******/

@end


