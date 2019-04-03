//
//  UIView+MKAnnotationView.m
//  SK-Lesson-38 MKMapView Part 2
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//

//@import MapKit;

#import "UIView+MKAnnotationView.h"
#import <MapKit/MKAnnotationView.h>

@implementation UIView (MKAnnotationView)

- (MKAnnotationView*) superAnnotationView
{
    if ([self isKindOfClass:[MKAnnotationView class]])
    {
        return (MKAnnotationView*)self;
    }
    
    if (!self.superview)
    {
        return nil;
    }
    
    return [self.superview superAnnotationView];
}

@end
