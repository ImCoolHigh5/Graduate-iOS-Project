//
//  MSStudent.h
//  Students
//
//  Created by Jason Welch on 7/8/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Student.h"

@interface MSStudent : Student

@property (nonatomic) float totalCreditsEarned;
@property (nonatomic) float totalCreditsNeeded;

@property (strong, nonatomic) NSDictionary *requirements;

@end
