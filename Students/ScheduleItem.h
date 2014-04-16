//
//  ScheduleItem.h
//  Students
//
//  Created by Jason Welch on 2/27/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

// Still using the same configuration from 701

#import <Foundation/Foundation.h>

@interface ScheduleItem : NSObject

#pragma mark - Public Properties

@property (nonatomic, assign) int period;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* teacher;
@property (nonatomic, copy) NSString* roomNumber;

#pragma mark - Public Methods

-(id) initWithPeriod:(int)aPeriod
               name:(NSString*)aName
			 teacher:(NSString*)aTeacher
		  roomNumber:(NSString*)aRoomNumber;

 @end
