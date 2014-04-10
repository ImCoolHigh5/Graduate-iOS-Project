//
//  ScheduleDataController.h
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ScheduleItem;

@interface ScheduleDataController : NSObject

/****** Old way *******
@property (nonatomic, copy) NSArray *studentSchedule;

-(id) initWithStudentIDNumber:(int)studentIDNumber;

-(NSUInteger)scheduleItemCount;

-(ScheduleItem *)scheduleItemAtIndex: (NSUInteger)index;

-(void) addScheduleItemWithPeriod:(int)aPeriod
					   name:(NSString*)aName
						  teacher:(NSString*)aTeacher
					   roomNumber:(NSString*)aRoomNumber;
****** Old way *******/

/* Returns the array that was once the Schedule property of a Person */
+(NSArray*)createScheduleForScheduleID:(int)idNumber;

@end
