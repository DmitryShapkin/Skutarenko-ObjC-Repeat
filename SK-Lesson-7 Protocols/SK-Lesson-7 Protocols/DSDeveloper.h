//
//  DSDeveloper.h
//  SK-Lesson-7 Protocols
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PatientProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DSDeveloper : NSObject <PatientProtocol>

@property (assign, nonatomic) CGFloat experience;
@property (strong, nonatomic) NSString* name;

- (void)work;

@end

NS_ASSUME_NONNULL_END
