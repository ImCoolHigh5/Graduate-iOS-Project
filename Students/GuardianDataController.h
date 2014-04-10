//
//  GuardianDataController.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Guardian;

@interface GuardianDataController : NSObject

-(NSUInteger)guardianCount;

-(Guardian *)guardianAtIndex: (NSUInteger)index;

-(Guardian*)makeGuardianFromNSDictionary:(NSDictionary*)guardianRaw;

//-(void) addGuardianWithGuardianIDNumber:(int)guardianIDNumber
//						   andFirstName:(NSString*)firstName
//							andLastName: (NSString*) lastName
//						 andAreTheyMale:(BOOL)isMale
//						 andPhoneNumber:(NSString*) phoneNumber
//						 andHouseNumber:(NSString*) houseNumber
//							  andStreet:(NSString*) street
//								andCity:(NSString*) city
//							   andState:(NSString*) state
//							 andZipCode:(int) zipCode
//					   andIsMainContact:(BOOL) isMainContact
//				  andIsEmergencyContact:(BOOL) isEmergencyContact
//				andIsResidenceOfStudent:(BOOL) isResidenceOfStudent;
@end
