//
//  Schedule.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Schedule.h"

@implementation Schedule

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


/*
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
*/
@end
