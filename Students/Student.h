//
//  Student.h
//  Students
//
//  Created by Jason Welch on 2/23/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

// Now modeled after to properties from a "Student.plist" entity

@interface Student : NSObject

@property (nonatomic, assign) int studentIDNumber;
@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, assign) BOOL isMale;
@property (nonatomic) int homeroomTeacherID;
@property (nonatomic) NSArray *guardianIDArray;
@property (nonatomic) int scheduleID;


-(id) initWithStudentIDNumber:(int)studentIDNumber
				 andFirstName:(NSString*)firstName
				  andLastName: (NSString*) lastName
			   andAreTheyMale:(BOOL)isMale
		 andHomeroomTeacherID:(int) homeroomTeacherID
				andGuardianIDArray:(NSArray*) guardianIDArray
				andScheduleID:(int) scheduleID;

-(void) printStudent;
-(NSDictionary*)prepareForUpload;


//-(NSArray*)prepareForUploadTest; /********/
@end
