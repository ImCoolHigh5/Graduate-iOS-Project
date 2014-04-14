//
//  Schedule.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

// Now modeled after to properties from a "Schedule.plist" entity
// This entire class might not be necessary

#import <Foundation/Foundation.h>
#import "ScheduleItem.h"

@interface Schedule : NSObject


 @property (nonatomic, assign) int scheduleIDNumber;
 @property (nonatomic, assign) int personID;
 @property (nonatomic, assign) int amHomeroomSessionID;
 @property (nonatomic, assign) int period1SessionID;
 @property (nonatomic, assign) int period2SessionID;
 @property (nonatomic, assign) int period3SessionID;
 @property (nonatomic, assign) int period4SessionID;
 @property (nonatomic, assign) int period5SessionID;
 @property (nonatomic, assign) int period6SessionID;
 @property (nonatomic, assign) int pmHomeroomSessionID;

/*
@property (nonatomic, assign) int scheduleIDNumber;
@property (nonatomic, assign) int personID;
@property (nonatomic, assign) ScheduleItem* amHomeroom;
@property (nonatomic, assign) ScheduleItem* period1;
@property (nonatomic, assign) ScheduleItem* period2;
@property (nonatomic, assign) ScheduleItem* period3;
@property (nonatomic, assign) ScheduleItem* period4;
@property (nonatomic, assign) ScheduleItem* period5;
@property (nonatomic, assign) ScheduleItem* period6;
@property (nonatomic, assign) ScheduleItem* pmHomeroom;


// This might not be necessary since the ScheduleDataController handles data assignment
-(id) initWithScheduleIDNumber:(int)scheduleIDNumber
				   andPersonID:(int)personID
				 andAMHomeroom:(ScheduleItem*)amHomeroom
					andPeriod1:(ScheduleItem*)period1
					andPeriod2:(ScheduleItem*)period2
					andPeriod3:(ScheduleItem*)period3
					andPeriod4:(ScheduleItem*)period4
					andPeriod5:(ScheduleItem*)period5
					andPeriod6:(ScheduleItem*)period6
				 andPMHomeroom:(ScheduleItem*)pmHomeroom;

*/
 -(id) initWithScheduleIDNumber:(int)scheduleIDNumber
 andPersonID:(int)personID
 andAMHomeroomSessionID:(int)amHomeroomSessionID
 andPeriod1SessionID:(int)period1SessionID
 andPeriod2SessionID:(int)period2SessionID
 andPeriod3SessionID:(int)period3SessionID
 andPeriod4SessionID:(int)period4SessionID
 andPeriod5SessionID:(int)period5SessionID
 andPeriod6SessionID:(int)period6SessionID
 andPMHomeroomSessionID:(int)pmHomeroomSessionID;

-(id)initWithPlistDictionary:(NSDictionary*)entity;
 
@end
