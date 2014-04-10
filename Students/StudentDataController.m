//
//  StudentDataController.m
//  Students
//
//  Created by Jason Welch on 2/23/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "StudentDataController.h"
#import "Student.h"

@interface StudentDataController ()

@property (nonatomic, readonly) NSMutableArray *studentList;

-(void) initializeDefaultStudents;

/*********testing purposes******/
#define MyLog if(0); else NSLog

/****** ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ****/

@end

@implementation StudentDataController

-(id) init {
	self = [super init];
	
	if(self) {
		_studentList = [[NSMutableArray alloc] init];
		[self initializeDefaultStudents];
		return self;
	}
	return nil;
}

#warning Update to utilize PlistDataController
-(void) initializeDefaultStudents {
	NSString *pathToStudentPList = [[NSBundle mainBundle] pathForResource:STUDENT_PLIST_TITLE ofType:@"plist"];
	NSArray *defaultStudentPList = [NSArray arrayWithContentsOfFile:pathToStudentPList];
	for (NSDictionary *studentInfo in defaultStudentPList) {
		[_studentList addObject:[self makeStudentFromNSDictionary:studentInfo]];
	}
}

-(Student*)makeStudentFromNSDictionary:(NSDictionary*)studentInfo {
	Student *newStudent = [[Student alloc] initWithStudentIDNumber:[studentInfo[ID_NUMBER] intValue]
													  andFirstName:studentInfo[FIRST_NAME]
													   andLastName:studentInfo[LAST_NAME]
													andAreTheyMale:[studentInfo[GENDER_IS_MALE] boolValue]
											  andHomeroomTeacherID:[studentInfo[STAFF_ID_FOR_STUDENT] intValue]
												andGuardianIDArray:studentInfo[GUARDIAN_ARRAY_FOR_STUDENT]
													 andScheduleID:[studentInfo[SCHEDULE_ID_FOR_STUDENT] intValue]];
	
	return newStudent;
	
}

// how many students are there?
-(NSUInteger)studentCount {
	return [self.studentList count];
}

// which student is this??
-(Student *)studentAtIndex:(NSUInteger)index {
	return [self.studentList objectAtIndex:index];
}

@end
