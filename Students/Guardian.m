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


@end
