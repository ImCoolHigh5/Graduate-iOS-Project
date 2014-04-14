//
//  TestButtonDataController.m
//  Students
//
//  Created by Jason Welch on 4/12/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

// I decided it would be eaiser to run tests through a seperate class so as to keep my other code clean.

#import "TestButtonDataController.h"


#import "StaffDataController.h"
#import "Staff.h"
#import "Schedule.h"
#import "ScheduleDataController.h"
#import "Student.h"
#import "StudentDataController.h"
#import "IDNumberDatabaseController.h"

#define MyLog if(0); else NSLog
/****** ^^^^^^^^^^^^Change to 1 before launch^^^^^^^^^^^^^^^^^^ ****/

@implementation TestButtonDataController

// This will be called when the Test button is pressed
// Any test methods should be called from here
-(void)runTests {
	
	[self testIDGeneration];
}


-(void)testStudentScheduleGeneration {
	StaffDataController *testing = [[StaffDataController alloc] init];
	for (int i = 0; i < [testing staffCount]; i++) {
		Staff *thisStaff = [[Staff alloc] init];
		thisStaff = [testing staffAtIndex:i];
		NSArray *thisSchedule = [[NSArray alloc] init];
		thisSchedule = [ScheduleDataController createScheduleForScheduleID:thisStaff.scheduleID];
		
		MyLog(@"%@", thisStaff.lastName);
	}
//	MyLog(@"%@", testing.studentSchedule); // No longer uses this function
}

-(void)testAddingNewStudents {
	NSArray *newStudentGuardians = [[NSArray alloc] initWithObjects:@14, nil];
	Student *newStudent = [[Student alloc] initWithStudentIDNumber:505 andFirstName:@"Paul" andLastName:@"Dean" andAreTheyMale:YES andHomeroomTeacherID:27 andGuardianIDArray:newStudentGuardians andScheduleID:16];
	
	
	//	NSArray *testArray = [[NSArray alloc] initWithArray:[newStudent prepareForUploadTest]];
	[newStudent printStudent];
	[plistDC addToPlistObject:newStudent];
}

-(void)testRosterCreation {
	NSArray *idListArray = [[NSArray alloc] initWithArray:[plistDC getIDsFromPlist:STUDENT_PLIST_TITLE]];
	MyLog(@"%@",idListArray);
	
}

-(void)testGetStudentsInSession {
	NSArray *studentsInSession42 = [[NSArray alloc] init];
	StudentDataController *studentDC = [[StudentDataController alloc] init];
	studentsInSession42 = [studentDC getStudentsInSession:42 fromScheduleItem:PERIOD_1_SESSION_ID];
	MyLog(@"%@",studentsInSession42);
	
}

-(void)testIDGeneration {
	
	IDNumberDatabaseController *idNumDB = [[IDNumberDatabaseController alloc] init]; // For new idNumber
	int testNumber = [idNumDB getIDNumberForNewEntityWithType:STUDENT_PLIST_TITLE];
	MyLog(@"%i",testNumber);
}

@end
