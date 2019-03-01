//
//  DSPatient.m
//  SK-Lesson-9
//
//  Created by Dmitry Shapkin on 01/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSPatient.h"

@implementation DSPatient

- (BOOL)howAreYou {
    
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
        [self.delegate patientFeelsBad:self];
    }
    
    return iFeelGood;
}

- (void)takePill {
    NSLog(@"%@ takes a pill", self.name);
}

- (void)makeShot {
    NSLog(@"%@ make a shot", self.name);
}

@end
