//
//  MSStudent.h
//  Students
//
//  Created by Jason Welch on 7/8/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Student.h"

@interface MSStudent : Student
#pragma mark - IBOutlets


#pragma mark - Public Properties

@property (nonatomic) float totalCreditsEarned;
@property (nonatomic) float totalCreditsNeeded;

@property (strong, nonatomic) NSDictionary *requirements;
@property (strong, nonatomic) NSArray *electivesPassed; // array of indexes refering to electives available

#pragma mark - IBActions


#pragma mark - Public Methods

-(id) initWithStudentIDNumber:(int)studentIDNumber;
-(id) initWithPlistDictionary:(NSDictionary*)entity;
-(int)gradeLevel;
-(NSString*)printableGradeLevel;

@end
