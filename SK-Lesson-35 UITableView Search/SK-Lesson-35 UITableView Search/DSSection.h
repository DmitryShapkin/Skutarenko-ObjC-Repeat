//
//  DSSection.h
//  SK-Lesson-35
//
//  Created by Dmitry Shapkin on 02/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface DSSection : NSObject

@property (strong, nonatomic) NSString* sectionName;
@property (strong, nonatomic) NSMutableArray* itemsArray;

@end

NS_ASSUME_NONNULL_END
