//
//  ScheduleItem.m
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "ScheduleItem.h"

@implementation ScheduleItem

#pragma mark - Custom Initialization
// Initializing by passing each value
-(id) initWithPeriod:(int)aPeriod
				name:(NSString*)aName
			 teacher:(NSString*)aTeacher
		  roomNumber:(NSString*)aRoomNumber{
	self = [super init];
    if (self) {
		_period = aPeriod;
        _name = aName;
        _teacher = aTeacher;
		_roomNumber = aRoomNumber;
        return self;
    }
    return nil;
}

@end
