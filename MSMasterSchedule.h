//
//  MSMasterSchedule.h
//  Students
//
//  Created by Jason Welch on 7/12/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Session.h"

@interface MSMasterSchedule : NSObject

@property (strong, nonatomic) NSDictionary *offeredCourseLoad;

-(void) configureScheduleForStudents:(NSArray*)studentIDs;

@end
