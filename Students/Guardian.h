//
//  Guardian.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

// Now modeled after to properties from a "Guardian.plist" entity

#import <Foundation/Foundation.h>

@interface Guardian : NSObject

@property (nonatomic, assign) int guardianIDNumber;
@property (nonatomic, copy) NSString* firstName;
@property (nonatomic, copy) NSString* lastName;
@property (nonatomic, assign) BOOL isMale;
@property (nonatomic, copy) NSString* phoneNumber;
@property (nonatomic, copy) NSString* houseNumber;
@property (nonatomic, copy) NSString* street;
@property (nonatomic, copy) NSString* city;
@property (nonatomic, copy) NSString* state;
@property (nonatomic, assign) int zipCode;
@property (nonatomic, assign) BOOL isMainContact;
@property (nonatomic, assign) BOOL isEmergencyContact;
@property (nonatomic, assign) BOOL isResidenceOfStudent;



-(id) initWithGuardianIDNumber:(int)guardianIDNumber
				  andFirstName:(NSString*)firstName
				   andLastName: (NSString*) lastName
				andAreTheyMale:(BOOL)isMale
				andPhoneNumber:(NSString*) phoneNumber
				andHouseNumber:(NSString*) houseNumber
					 andStreet:(NSString*) street
					   andCity:(NSString*) city
					  andState:(NSString*) state
					andZipCode:(int) zipCode
			  andIsMainContact:(BOOL) isMainContact
		 andIsEmergencyContact:(BOOL) isEmergencyContact
	   andIsResidenceOfStudent:(BOOL) isResidenceOfStudent;

-(id) initWithID:(int) idNumber;
@end
