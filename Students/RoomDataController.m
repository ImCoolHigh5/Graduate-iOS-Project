//
//  RoomDataController.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "RoomDataController.h"
#warning Format from Student Template

//#import "Student.h"
//
//@interface StudentDataController ()
//
//@property (nonatomic, readonly) NSMutableArray *studentList;
//
//-(void) initializeDefaultStudents;
//
//@end
//
//@implementation StudentDataController
//
//-(id) init {
//	self = [super init];
//	
//	if(self) {
//		_studentList = [[NSMutableArray alloc] init];
//		[self initializeDefaultStudents];
//		return self;
//	}
//	return nil;
//}
//
//-(void) initializeDefaultStudents {
//	NSString *pathToStudentPList = [[NSBundle mainBundle] pathForResource:@"Student" ofType:@"plist"];
//	NSArray *defaultStudentPList = [NSArray arrayWithContentsOfFile:pathToStudentPList];
//	for (NSDictionary *studentInfo in defaultStudentPList) {
//		
//		
//		[self addStudentWtihStudentIDNumber:[studentInfo[@"idNumber"] intValue]
//							   andFirstName:studentInfo[@"firstName"]
//								andLastName:studentInfo[@"lastName"]
//							 andAreTheyMale:[studentInfo[@"isMale"] boolValue]
//					   andHomeroomTeacherID:[studentInfo[@"staffID"] intValue]
//							  andGuardianID:[studentInfo[@"guardianID"] intValue]
//							  andScheduleID:[studentInfo[@"scheduleID"] intValue] ];
//	}
//	
//}
//
//-(void) addStudentWtihStudentIDNumber:(int)studentIDNumber
//						 andFirstName:(NSString*)firstName
//						  andLastName: (NSString*) lastName
//					   andAreTheyMale:(BOOL)isMale
//				 andHomeroomTeacherID:(int) homeroomTeacherID
//						andGuardianID:(int) guardianID
//						andScheduleID:(int) scheduleID {
//	
//	Student *newStudent = [[Student alloc] initWithStudentIDNumber:studentIDNumber
//													  andFirstName:firstName
//													   andLastName:lastName
//													andAreTheyMale:isMale
//											  andHomeroomTeacherID:homeroomTeacherID
//													 andGuardianID:guardianID
//													 andScheduleID:scheduleID ];
//	[self.studentList addObject:newStudent];
//}
//
//// how many students are there?
//-(NSUInteger)studentCount {
//	return [self.studentList count];
//}
//
//// which student is this??
//-(Student *)studentAtIndex:(NSUInteger)index {
//	return [self.studentList objectAtIndex:index];
//}
//
//@end
//
