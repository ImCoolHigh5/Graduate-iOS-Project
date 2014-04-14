//
//  Schedule.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Schedule.h"

@implementation Schedule
/*
-(id) initWithScheduleIDNumber:(int)scheduleIDNumber
				   andPersonID:(int)personID
				 andAMHomeroom:(ScheduleItem*)amHomeroom
					andPeriod1:(ScheduleItem*)period1
					andPeriod2:(ScheduleItem*)period2
					andPeriod3:(ScheduleItem*)period3
					andPeriod4:(ScheduleItem*)period4
					andPeriod5:(ScheduleItem*)period5
					andPeriod6:(ScheduleItem*)period6
				 andPMHomeroom:(ScheduleItem*)pmHomeroom {
	
	self = [super init];
    if (self) {
		_scheduleIDNumber = scheduleIDNumber;
		_personID = personID;
		_amHomeroom = amHomeroom;
		_period1 = period1;
		_period2 = period2;
		_period3 = period3;
		_period4 = period4;
		_period5 = period5;
		_period6 = period6;
        _pmHomeroom = pmHomeroom;
        return self;
    }
    return nil;
	
}
*/

-(id)initWithPlistDictionary:(NSDictionary*)entity {
	self = [super init];
	if (self) {
	
	if ([entity count] != 0) {
		_scheduleIDNumber = [entity[ID_NUMBER] intValue];
		_personID = [entity[SCHEDULE_OWNER_ID] intValue];
		_amHomeroomSessionID = [entity[AM_HOMEROOM_SESSION_ID] intValue];
		_period1SessionID = [entity[PERIOD_1_SESSION_ID] intValue];
		_period2SessionID = [entity[PERIOD_2_SESSION_ID] intValue];
		_period3SessionID = [entity[PERIOD_3_SESSION_ID] intValue];
		_period4SessionID = [entity[PERIOD_4_SESSION_ID] intValue];
		_period5SessionID = [entity[PERIOD_5_SESSION_ID] intValue];
		_period6SessionID = [entity[PERIOD_6_SESSION_ID] intValue];
        	_pmHomeroomSessionID = [entity[PM_HOMEROOM_SESSION_ID] intValue];
        	

		return self;
	}
    }
    return nil;

}

-(NSDictionary*)prepareForUpload {
	
	NSNumber *scheduleIDNumber = [[NSNumber alloc] initWithInt:_scheduleIDNumber];
	NSNumber *personID = [[NSNumber alloc] initWithInt:_personID];
	NSNumber *amHomeroom = [[NSNumber alloc] initWithInt:_amHomeroomSessionID];
	NSNumber *period1 = [[NSNumber alloc] initWithInt:_period1SessionID];
	NSNumber *period2 = [[NSNumber alloc] initWithInt:_period2SessionID];
	NSNumber *period3 = [[NSNumber alloc] initWithInt:_period3SessionID];
	NSNumber *period4 = [[NSNumber alloc] initWithInt:_period4SessionID];
	NSNumber *period5 = [[NSNumber alloc] initWithInt:_period5SessionID];
	NSNumber *period6 = [[NSNumber alloc] initWithInt:_period6SessionID];
	NSNumber *pmHomeroom = [[NSNumber alloc] initWithInt:_pmHomeroomSessionID];
	
	NSArray *keys = [[NSArray alloc] initWithObjects: ID_NUMBER, SCHEDULE_OWNER_ID, AM_HOMEROOM_SESSION_ID, PERIOD_1_SESSION_ID, PERIOD_2_SESSION_ID, PERIOD_3_SESSION_ID, PERIOD_4_SESSION_ID, PERIOD_5_SESSION_ID, PERIOD_6_SESSION_ID, PM_HOMEROOM_SESSION_ID, nil];
	NSArray*objects = [[NSArray alloc] initWithObjects: scheduleIDNumber, personID, amHomeroom, period1, period2, period3, period4, period5, period6, pmHomeroom, nil];
	NSDictionary *newSchedule = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
	
	return newSchedule;
}


-(id) initWithScheduleIDNumber:(int)scheduleIDNumber
				   andPersonID:(int)personID
		andAMHomeroomSessionID:(int)amHomeroomSessionID
		   andPeriod1SessionID:(int)period1SessionID
		   andPeriod2SessionID:(int)period2SessionID
		   andPeriod3SessionID:(int)period3SessionID
		   andPeriod4SessionID:(int)period4SessionID
		   andPeriod5SessionID:(int)period5SessionID
		   andPeriod6SessionID:(int)period6SessionID
		andPMHomeroomSessionID:(int)pmHomeroomSessionID {
	
	self = [super init];
    if (self) {
		_scheduleIDNumber = scheduleIDNumber;
		_personID = personID;
		_amHomeroomSessionID = amHomeroomSessionID;
		_period1SessionID = period1SessionID;
		_period2SessionID = period2SessionID;
		_period3SessionID = period3SessionID;
		_period4SessionID = period4SessionID;
		_period5SessionID = period5SessionID;
		_period6SessionID = period6SessionID;
		_pmHomeroomSessionID = pmHomeroomSessionID;
        
        return self;
    }
    return nil;
	
}

@end
