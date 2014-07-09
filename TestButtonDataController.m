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
#import "Session.h"
#import "MSStudent.h"

#warning Change MyLog value to 1 before release
#define MyLog if(0); else NSLog

@interface TestButtonDataController ()

@property (nonatomic, strong) NSString *periodNumberAssignment;
@property (nonatomic, strong) NSString *staffNumberAssignment;

@end

@implementation TestButtonDataController

// This will be called when the Test button is pressed
// Any test methods should be called from here
-(void)runTests {
	
	[self testAddingNewStudents];
	[self makeNSUerDefaults]; // The test button has been repurposed for generating sample data within in the app
	
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
	MSStudent *newStudent = [[MSStudent alloc] initWithStudentIDNumber:505 andFirstName:@"Paul" andLastName:@"Dean" andAreTheyMale:YES andHomeroomTeacherID:27 andGuardianIDArray:newStudentGuardians andScheduleID:16 andCounty:@"AAC"];
	
	[self printStudent:newStudent];
//	[plistDC addToPlistObject:newStudent];
}

// Prints all of the elements of a Student to MyLog
-(void) printStudent:(MSStudent*)student {
	
	// Since BOOL is primitave, we need to convert _isMale to an NSString
	NSString *maleOrNo = [student stringForIsMale];
	
    NSLog(@"\n FirstName: %@ \n LastName: %@ \n IsMale: %@ \n StaffID: %d \n ScheduleID: %d \n GuardianID(s): %@ \n Stuff: %@",
		  student.firstName, student.lastName, maleOrNo, student.homeroomTeacherID, student.scheduleID, student.guardianIDArray, student.requirements);
}


-(void)testRosterCreation {
	NSArray *idListArray = [[NSArray alloc] initWithArray:[plistDC getIDsFromPlist:STUDENT_PLIST_TITLE]];
	MyLog(@"%@",idListArray);
	// More programming needed
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
-(void)makeNSUerDefaults {
	
	[plistDC convertPListsToNSUserDefaults:(NSString*)STUDENT_PLIST_TITLE];
	[plistDC convertPListsToNSUserDefaults:(NSString*)STAFF_PLIST_TITLE];
	[plistDC convertPListsToNSUserDefaults:(NSString*)GUARDIAN_PLIST_TITLE];
	[plistDC convertPListsToNSUserDefaults:(NSString*)ID_NUMBER_DATABASE_PLIST_TITLE];
	[plistDC convertPListsToNSUserDefaults:(NSString*)ROOM_PLIST_TITLE];
	[plistDC convertPListsToNSUserDefaults:(NSString*)SESSION_PLIST_TITLE];
	[plistDC convertPListsToNSUserDefaults:(NSString*)SCHEDULE_PLIST_TITLE];
}

@end