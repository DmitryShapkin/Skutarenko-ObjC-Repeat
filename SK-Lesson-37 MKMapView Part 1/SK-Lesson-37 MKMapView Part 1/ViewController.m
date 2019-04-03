//
//  ViewController.m
//  SK-Lesson-37 MKMapView Part 1
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


@import MapKit;

#import "ViewController.h"
#import "DSMapAnnotation.h"


@interface ViewController () <MKMapViewDelegate>

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem* addButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self action:@selector(actionAdd:)];
    
    UIBarButtonItem* zoomButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                  target:self action:@selector(actionShowAll:)];
    
    /*
     UIBarButtonItem* fixed =
     [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
     target:nil action:nil];
     
     fixed.width = 50;
     */
    
    /*
     UIBarButtonItem* flexible =
     [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
     target:nil action:nil];
     */
    
    //self.navigationItem.rightBarButtonItems = @[flexible, zoomButton, flexible, flexible, addButton, flexible];
    
    self.navigationItem.rightBarButtonItems = @[zoomButton, addButton];
}


#pragma mark - Action

- (void)actionAdd:(UIBarButtonItem*)sender
{
    DSMapAnnotation* annotation = [[DSMapAnnotation alloc] init];
    
    annotation.title = @"Test Title";
    annotation.subtitle = @"Test Subtitle";
    annotation.coordinate = self.mapView.region.center;
    
    [self.mapView addAnnotation:annotation];
}

- (void)actionShowAll:(UIBarButtonItem*)sender
{
    MKMapRect zoomRect = MKMapRectNull;
    
    for (id <MKAnnotation> annotation in self.mapView.annotations)
    {
        CLLocationCoordinate2D location = annotation.coordinate;
        
        MKMapPoint center = MKMapPointForCoordinate(location);
        
        static double delta = 20000;
        
        MKMapRect rect = MKMapRectMake(center.x - delta, center.y - delta, delta * 2, delta * 2);
        
        zoomRect = MKMapRectUnion(zoomRect, rect);
    }
    
    zoomRect = [self.mapView mapRectThatFits:zoomRect];
    
    [self.mapView setVisibleMapRect:zoomRect
                        edgePadding:UIEdgeInsetsMake(50, 50, 50, 50)
                           animated:YES];
    
}


#pragma mark - MKMapViewDelegate

/*
 - (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
 NSLog(@"regionWillChangeAnimated");
 }
 
 - (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
 NSLog(@"regionDidChangeAnimated");
 }
 
 - (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
 NSLog(@"mapViewWillStartLoadingMap");
 }
 
 - (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
 NSLog(@"mapViewDidFinishLoadingMap");
 }
 
 - (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
 NSLog(@"mapViewDidFailLoadingMap");
 }
 
 - (void)mapViewWillStartRenderingMap:(MKMapView *)mapView {
 NSLog(@"mapViewWillStartRenderingMap");
 }
 
 - (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered {
 NSLog(@"mapViewDidFinishRenderingMap fullyRendered = %d", fullyRendered);
 }
 */

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    static NSString* identifier = @"Annotation";
    
    MKPinAnnotationView* pin = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!pin)
    {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        pin.pinTintColor = [UIColor purpleColor];
        pin.animatesDrop = YES;
        pin.canShowCallout = YES;
        pin.draggable = YES;
    }
    else
    {
        pin.annotation = annotation;
    }
    
    return pin;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
   fromOldState:(MKAnnotationViewDragState)oldState
{
    if (newState == MKAnnotationViewDragStateEnding)
    {
        CLLocationCoordinate2D location = view.annotation.coordinate;
        MKMapPoint point = MKMapPointForCoordinate(location);
        
        NSLog(@"\nlocation = {%f, %f}\npoint = %@", location.latitude, location.longitude, MKStringFromMapPoint(point));
    }
}

@end

