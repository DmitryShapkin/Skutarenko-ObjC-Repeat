//
//  DSObject.h
//  SK-Lesson-12 Blocks
//
//  Created by Dmitry Shapkin on 07/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ObjectBlock)(void);

@interface DSObject : NSObject

@property (strong, nonatomic) NSString* name;

- (void)testMethod:(ObjectBlock) block;

@end

NS_ASSUME_NONNULL_END
