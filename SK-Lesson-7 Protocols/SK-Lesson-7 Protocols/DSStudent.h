//
//  DSStudent.h
//  SK-Lesson-7 Protocols
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PatientProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DSStudent : NSObject <PatientProtocol>

@property (strong, nonatomic) NSString* universityName;
@property (strong, nonatomic) NSString* name;

- (void)study;

@end

NS_ASSUME_NONNULL_END
