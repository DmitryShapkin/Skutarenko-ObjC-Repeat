//
//  PatientProtocol.h
//  SK-Lesson-7 Protocols
//
//  Created by Dmitry Shapkin on 06/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PatientProtocol <NSObject>

@property (strong, nonatomic) NSString* name;

@required
- (BOOL)areYouOk;
- (void)takePill;
- (void)makeShot;

@optional
- (NSString*)howIsYourFamily;
- (NSString*)howIsYourJob;

@end

NS_ASSUME_NONNULL_END
