//
//  StaffDataController.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "StaffDataController.h"
#import "Staff.h"

@interface StaffDataController ()

@property (nonatomic, readonly) NSMutableArray *staffList;

@end

@implementation StaffDataController

-(id) init {
	self = [super init];
	
	if(self) {
		_staffList = [[NSMutableArray alloc] init];
		[self initializeDefaultStaff];
		return self;
	}
	return nil;
}

#warning Update to utilize PlistDataController
-(void) initializeDefaultStaff {
	NSString *pathToStaffPList = [[NSBundle mainBundle] pathForResource:STAFF_PLIST_TITLE ofType:@"plist"];
	NSArray *defaultStaffPList = [NSArray arrayWithContentsOfFile:pathToStaffPList];
	for (NSDictionary *staffInfo in defaultStaffPList) {
		
		
		[self addStaffWithStaffIDNumber:[staffInfo[ID_NUMBER] intValue]
						   andFirstName:staffInfo[FIRST_NAME]
							andLastName:staffInfo[LAST_NAME]
						 andAreTheyMale:[staffInfo[GENDER_IS_MALE] boolValue]
					   andSubjectTaught:staffInfo[SUBJECT_TAUGHT]
							  andRoomID:[staffInfo[HOMEROOM_ID_FOR_STAFF] intValue]
						  andScheduleID:[staffInfo[SCHEDULE_ID_FOR_STAFF] intValue]];
	}
	
}

-(void) addStaffWithStaffIDNumber:(int)staffIDNumber
					 andFirstName:(NSString*)firstName
					  andLastName: (NSString*) lastName
				   andAreTheyMale:(BOOL)isMale
				 andSubjectTaught:(NSString*) subject
						andRoomID:(int) roomID
					andScheduleID:(int) scheduleID {
	
	Staff *newStaff = [[Staff alloc] initWithStaffIDNumber:staffIDNumber
											  andFirstName:firstName
											   andLastName:lastName
											andAreTheyMale:isMale
										  andSubjectTaught:subject
												 andRoomID:roomID
											 andScheduleID:scheduleID  ];
	[self.staffList addObject:newStaff];
}

// how many students are there?
-(NSUInteger)staffCount {
	return [self.staffList count];
}

// which student is this??
-(Staff *)staffAtIndex:(NSUInteger)index {
	return [self.staffList objectAtIndex:index];
}

+(NSString*)getStaffNameWithID:(int)staffID {
	
	// Dynamically creates a string for the staff name, avoiding the creation of a complex Staff object
	BOOL isStaffMale = [plistDC getValueUsingKeyValue:GENDER_IS_MALE forEntityWithIDNumber:staffID inPlist:STAFF_PLIST_TITLE]; // finding the gender of the staff member listed for this session
	NSString *staffName = [[NSString alloc] init];
	if (isStaffMale) {
		staffName = @"Mr. ";
	} else {
		staffName = @"Ms. ";
	}
	
	NSString *staffLastName = [[NSString alloc] init];
	staffLastName = [plistDC getValueUsingKeyValue:LAST_NAME forEntityWithIDNumber:staffID inPlist:STAFF_PLIST_TITLE];
	
	// stringByAppendingString can't work with a nil value so in the case of lunch we must test first
	if (staffLastName) {
		staffName = [staffName stringByAppendingString:staffLastName];
	} else
		staffName = @"Available Staff";
	
	return staffName;
}

@end

