//
//  DSDoctor.h
//  SK-Lesson-9
//
//  Created by Dmitry Shapkin on 01/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSPatient.h"

@protocol DSPatientDelegate;

@interface DSDoctor : NSObject <DSPatientDelegate>

@end
