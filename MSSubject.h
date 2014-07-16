//
//  MSSubject.h
//  Students
//
//  Created by Jason Welch on 7/8/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSSubject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) float creditsEarned;
@property (nonatomic) float creditsNeeded;
@property (strong, nonatomic) NSNumber *delayedMatriculation;

@end
