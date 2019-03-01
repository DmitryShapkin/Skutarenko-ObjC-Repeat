//
//  DSPatient.h
//  SK-Lesson-9
//
//  Created by Dmitry Shapkin on 01/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DSPatientDelegate;

@interface DSPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat temperature;
@property (weak, nonatomic) id <DSPatientDelegate> delegate;

- (BOOL)howAreYou;
- (void)takePill;
- (void)makeShot;

@end


@protocol DSPatientDelegate

- (void)patientFeelsBad:(DSPatient*) patient;
- (void)patient:(DSPatient*) patient iHaveQuestion:(NSString*) question;

@end
