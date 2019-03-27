//
//  DSDrawingView.m
//  SK-Lesson-24 UIView Drawings
//
//  Created by Dmitry Shapkin on 12/03/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

#import "DSDrawingView.h"

@implementation DSDrawingView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"coder");
        self.backgroundColor = UIColor.redColor;
        
    }
    return self;
}



- (void)drawRect:(CGRect)rect {
    NSLog(@"drawRect: %@", NSStringFromCGRect(rect));
}

@end
