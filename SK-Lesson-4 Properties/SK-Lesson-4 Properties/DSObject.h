//
//  DSObject.h
//  SK-Lesson-4 Properties
//
//  Created by Dmitry Shapkin on 04/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSObject : NSObject <NSCopying>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger someNumber;

@end
