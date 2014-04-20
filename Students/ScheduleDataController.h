//
//  ScheduleDataController.h
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Schedule;

@interface ScheduleDataController : NSObject

#pragma mark - Public Method

-(NSUInteger)scheduleCount;
-(Schedule*)scheduleAtIndex:(NSUInteger)index;

+(NSArray*)createScheduleForScheduleID:(int)idNumber;
+(NSArray*)getArrayOfSchedules;

@end
