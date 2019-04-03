//
//  UIView+MKAnnotationView.h
//  SK-Lesson-38 MKMapView Part 2
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


@import UIKit;

@class MKAnnotationView;


NS_ASSUME_NONNULL_BEGIN

@interface UIView (MKAnnotationView)

- (MKAnnotationView*) superAnnotationView;

@end

NS_ASSUME_NONNULL_END
