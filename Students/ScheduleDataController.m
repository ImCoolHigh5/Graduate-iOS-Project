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


@interface ScheduleDataController ()

@end

@implementation ScheduleDataController

+(NSArray*)createScheduleForScheduleID:(int)idNumber {
	
	NSMutableArray *scheduleItems = [[NSMutableArray alloc] init]; // this will be filled with ScheduleItem objects
	
	NSDictionary *scheduleFromPlist = [[NSDictionary alloc] initWithDictionary:[plistDC getEntityWithIDNumber:idNumber inPlist:SCHEDULE_PLIST_TITLE]]; // uses the Schedule ID number passed in (taken from the Person object in question) to find the coorsponding schedule in the "Schedule.plist"
	
// Accouting for the extra properties of Schedule (idNumber and personID)
	int totalSessions = (int)[scheduleFromPlist count];
	totalSessions -= 2;
	
	ScheduleItem* newItem = [[ScheduleItem alloc] init]; // Will be reused to fill the array
	
	//get the name of a session
	//get the room name
	//get the teacher name
	//set the period number (why I'm not sure)
	
	for (int i = 0; i < totalSessions; i++) { // Uses the total amount of sessions
		if (i == 0) {
			//amHomeroom
			newItem = [self getSessionWithIDNumber:[scheduleFromPlist[AM_HOMEROOM_SESSION_ID] intValue] /*andPeriodNumber:i */]; // Using the sessionID stored in each Schedule item, we can gather up the information needed to display a schedule
			
		} else if (i == (totalSessions-1)) {
			//pmHomeroom
			newItem = [self getSessionWithIDNumber:[scheduleFromPlist[PM_HOMEROOM_SESSION_ID] intValue] /*andPeriodNumber:totalSessions */];
		} else {
			// periods
			NSString *periodName = [[NSString alloc] initWithString:[NSString stringWithFormat:@"period%i", i]]; // using the current count as the period name, since it currently matches up as such **** will need to ammend ****
			
			newItem = [self getSessionWithIDNumber:[scheduleFromPlist[periodName] intValue] /*andPeriodNumber:i */];
		}
		newItem.period = i;
		[scheduleItems addObject:newItem];
		
		NSLog(@"Period %i added", i); // For testing purposes
	}
	NSLog(@"%i total sessions added",totalSessions);// For testing purposes
	
	NSArray *toBeReturned = [[NSArray alloc] initWithArray:scheduleItems]; // put into an array for memory conservation

	return toBeReturned;
}

+(ScheduleItem*)getSessionWithIDNumber:(int)idNumber /*andPeriodNumber:(int)period */{
	
	ScheduleItem* newItem = [[ScheduleItem alloc] init];
	
	// The PlistDataController returns a NSDictionary matching the Entity specified, which in this case is a Session. This is nested in a custom init allowing you to transform the NSDictionary into a Session object
	Session *newSession = [[Session alloc] initWithPlistDictionary:[plistDC getEntityWithIDNumber:idNumber inPlist:SESSION_PLIST_TITLE]];
	
	newItem.name = newSession.name;
	newItem.roomNumber = [plistDC getValueUsingKeyValue:ROOM_NAME forEntityWithIDNumber:newSession.roomID inPlist:ROOM_PLIST_TITLE];
	
	newItem.teacher = [StaffDataController getStaffNameWithID:newSession.staffID]; // Dynamically creates a string for the staff name, avoiding the creation of a complex Staff object
	return newItem;
	
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
 // When the Test button is pressed, it prints each Period on a student's schedule in the log
 #pragma mark - Testing Purposes
 -(void) printScheduleToLog:(NSArray *)printableSchedule {
 for (ScheduleItem *scheduleItem in printableSchedule) {
 MyLog(@"%d\n %@\n %@\n %@\n", scheduleItem.period, scheduleItem.name, scheduleItem.teacher, scheduleItem.roomNumber);
 }
 }
 ****** Old way *******/

@end


