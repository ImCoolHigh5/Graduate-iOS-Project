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

// This is the public method other objects can use to get a list of students in a given session
-(NSArray*)getStudentsInSession:(int)sessionID fromScheduleItem:(NSString*)sessionTime {
	
	
	NSMutableArray *studentsInSession = [[NSMutableArray alloc] init];
	// Fill with Student dictionaries from Student.plist
	NSArray *studentArray = [[NSArray alloc] initWithArray:[plistDC makeNSArrayFromPlistTitle:STUDENT_PLIST_TITLE]];
	
	for(int i = 0; i < [studentArray count]; i++) {
		NSDictionary *student = [[NSDictionary alloc] init];
		student = studentArray[i];
		// Need to go into the Schedule to get the right sessionID
		int scheduleID = [student[SCHEDULE_ID_FOR_STUDENT] intValue];
		int thisSessionID = [[plistDC getValueUsingKeyValue:sessionTime forEntityWithIDNumber:scheduleID inPlist:SCHEDULE_PLIST_TITLE] intValue];
		// Is this student in this session?
		if (thisSessionID == sessionID) {
			[studentsInSession addObject:student[ID_NUMBER]];
		}
	}
	
	NSArray *studentIDs = [[NSArray alloc] initWithArray:studentsInSession];
	return [self studentsFromIDList:studentIDs];
}

-(NSArray*)studentsFromIDList:(NSArray*)ids {
	
	NSMutableArray *students = [[NSMutableArray alloc] init];
	NSDictionary *student = [[NSDictionary alloc] init];
	
	// Goes through the array of student IDs
	for(int i = 0; i < [ids count]; i++) {
		
		int studentID = [ids[i] intValue];
		student = [plistDC getEntityWithIDNumber:studentID inPlist:STUDENT_PLIST_TITLE]; // Getting dictionary of this student Entity
		
		[students addObject:[self makeStudentFromNSDictionary:student]]; // Turns dictionary into Student object before storing it in the mutable array
	}
	
	NSArray *listOfStudents = [[NSArray alloc] initWithArray:students];
	return listOfStudents; // Returns the list of Student objects from the corrisponding IDs
}



#pragma mark Old Code

/*
// Searches the Student.plist for those that attend a specific session and returns an array of student id numbers
-(NSArray*)getStudentIDsInSession:(int)sessionID fromScheduleItem:(NSString*)sessionTime {
	
	NSMutableArray *studentsInSession = [[NSMutableArray alloc] init];
	// Fill with Student dictionaries from Student.plist
	NSArray *studentArray = [[NSArray alloc] initWithArray:[plistDC makeNSArrayFromPlistTitle:STUDENT_PLIST_TITLE]];
	
	for(int i = 0; i < [studentArray count]; i++) {
		NSDictionary *student = [[NSDictionary alloc] init];
		student = studentArray[i];
		// Need to go into the Schedule to get the right sessionID
		int scheduleID = [student[SCHEDULE_ID_FOR_STUDENT] intValue];
		int thisSessionID = [[plistDC getValueUsingKeyValue:sessionTime forEntityWithIDNumber:scheduleID inPlist:SCHEDULE_PLIST_TITLE] intValue];
		// Is this student in this session?
		if (thisSessionID == sessionID) {
			[studentsInSession addObject:student[ID_NUMBER]];
		}
	}
	
	NSArray *studentsToReturn = [[NSArray alloc] initWithArray:studentsInSession];
	return studentsToReturn;
}

// This is the public method other objects can use to get a list of students in a given session
-(NSArray*)getStudentsInSession:(int)sessionID fromScheduleItem:(NSString*)sessionTime {
	
	// Use other method to get Student IDs first...not sure why they need to be seperate...may consolidate once both function properly
	NSArray *studentIDs = [[NSArray alloc] initWithArray:[self getStudentIDsInSession:sessionID fromScheduleItem:sessionTime]];
	return [self studentsFromIDList:studentIDs];
}

 */
@end
