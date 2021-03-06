//
//  Guardian.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "Guardian.h"

@implementation Guardian

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
	   andIsResidenceOfStudent:(BOOL) isResidenceOfStudent {
	
	self = [super init];
    if (self) {
   		_guardianIDNumber = guardianIDNumber;
		_firstName = firstName;
        _lastName = lastName;
        _isMale = isMale;
		_phoneNumber = phoneNumber;
		_houseNumber = houseNumber;
		_street = street;
		_city = city;
		_state = state;
		_zipCode = zipCode;
		_isMainContact =isMainContact;
		_isEmergencyContact = isEmergencyContact;
		_isResidenceOfStudent = isResidenceOfStudent;
        
        return self;
    }
    return nil;
	
}

-(id) initWithID:(int) idNumber {
	
	if (self) {
		
		return self;
	}
	return nil;
}
// Returns a full name with gender indicating prefix
-(NSString*)getFullName {
	
		NSString *guardianPrefix = [[NSString alloc] init];
		if (self.isMale) {
			guardianPrefix = @"Mr. ";
		} else {
			guardianPrefix = @"Ms. ";
		}
	// to avoid nil errors with the return string
	if (!self.firstName) {
		self.firstName = @"";
	}
	if (!self.lastName) {
		self.lastName = @"";
	}
	return [NSString stringWithFormat:@"%@ %@ %@", guardianPrefix, self.firstName, self.lastName];
}

-(NSDictionary *)prepareForUpload {
	NSNumber *guardianIDNumber = [[NSNumber alloc] initWithInt:_guardianIDNumber];
	NSNumber *zipcode = [[NSNumber alloc] initWithInt:_zipCode];
	NSString *isMale = [self stringForBool:_isMale];
	NSString *isMainContact = [self stringForBool:_isMainContact];
	NSString *isEmergencyContact = [self stringForBool:_isEmergencyContact];
	NSString *isResident = [self stringForBool:_isResidenceOfStudent];
	
	NSArray *keys = [[NSArray alloc] initWithObjects:ID_NUMBER, FIRST_NAME, LAST_NAME, GENDER_IS_MALE,PHONE_NUMBER_FOR_GUARDIAN, HOUSE_NUMBER_FOR_GUARDIAN_ADDRESS, STREET_FOR_GUARDIAN_ADDRESS, CITY_FOR_GUARDIAN_ADDRESS, STATE_FOR_GUARDIAN_ADDRESS, ZIPCODE_FOR_GUARDIAN_ADDRESS, IS_GUARDIAN_MAIN_CONTACT, IS_GUARDIAN__EMERGENCY_CONTACT, IS_GUARDIAN_LIVING_WITH_STUDENT, nil];
	NSArray *objects = [[NSArray alloc] initWithObjects:guardianIDNumber, _firstName, _lastName, isMale, _phoneNumber, _houseNumber, _street, _city, _state, zipcode, isMainContact, isEmergencyContact, isResident, nil];
	NSDictionary *newGuardianForPlist = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
	
	return  newGuardianForPlist;
	
}

-(NSString*)stringForBool:(BOOL)boolValue {
	
	if (boolValue) {
		return @"YES";
	} else {
		return @"NO";
	}
	
}

@end
