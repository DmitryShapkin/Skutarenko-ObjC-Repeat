//
//  DSDancer.h
//  SK-Lesson-7 Protocols
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PatientProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DSDancer : NSObject <PatientProtocol>

@property (strong, nonatomic) NSString* favouriteDance;
@property (strong, nonatomic) NSString* name;

- (void)dance;

@end

NS_ASSUME_NONNULL_END
