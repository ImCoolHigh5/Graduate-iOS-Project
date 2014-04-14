//
//  StudentDataController.h
//  Students
//
//  Created by Jason Welch on 2/23/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;
@interface StudentDataController : NSObject

-(NSUInteger)studentCount;

-(Student *)studentAtIndex: (NSUInteger)index;

-(Student*)makeStudentFromNSDictionary:(NSDictionary*)studentInfo;

-(NSArray*)getStudentsInSession:(int)sessionID fromScheduleItem:(NSString*)sessionTime;

-(NSArray*) getArrayOfStudents;

@end
