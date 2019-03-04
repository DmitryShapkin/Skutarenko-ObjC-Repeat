//
//  DSBoxer.h
//  SK-Lesson-3
//
//  Created by Dmitry Shapkin on 04/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DSBoxer : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;

- (NSInteger)howOldAreYou;

@end
