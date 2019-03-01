//
//  DSDoctor.m
//  SK-Lesson-9
//
//  Created by Dmitry Shapkin on 01/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSDoctor.h"


@implementation DSDoctor

#pragma mark - DSPatientDelegate

- (void)patientFeelsBad:(DSPatient *) patient {
    NSLog(@"Patient %@ feels bad", patient.name);
    
    if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature >= 39.f) {
        [patient makeShot];
    } else {
        NSLog(@"Patient should rest");
    }
}

- (void)patient:(DSPatient *)patient iHaveQuestion:(NSString *)question {
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

@end
