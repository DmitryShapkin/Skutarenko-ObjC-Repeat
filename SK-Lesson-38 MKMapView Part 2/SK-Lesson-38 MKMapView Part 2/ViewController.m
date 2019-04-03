//
//  ViewController.m
//  SK-Lesson-38 MKMapView Part 2
//
//  Created by Dmitry Shapkin on 03/04/2019.
//  Copyright © 2019 Dmitry Shapkin. All rights reserved.
//


@import MapKit;

#import "ViewController.h"
#import "DSMapAnnotation.h"
#import "UIView+MKAnnotationView.h"


@interface ViewController () <MKMapViewDelegate>

@property (strong, nonatomic) CLGeocoder* geoCoder;
@property (strong, nonatomic) MKDirections* directions;

@end


@implementation ViewController

- (void) dealloc {
    if ([self.geoCoder isGeocoding])
    {
        [self.geoCoder cancelGeocode];
    }
    if ([self.directions isCalculating])
    {
        [self.directions cancel];
    }
}

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
    
    self.geoCoder = [[CLGeocoder alloc] init];
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
        
        UIButton* descriptionButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [descriptionButton addTarget:self action:@selector(actionDescription:) forControlEvents:UIControlEventTouchUpInside];
        pin.rightCalloutAccessoryView = descriptionButton;
        
        UIButton* directionButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [directionButton addTarget:self action:@selector(actionDirection:) forControlEvents:UIControlEventTouchUpInside];
        pin.leftCalloutAccessoryView = directionButton;
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

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]])
    {
        MKPolylineRenderer* renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        renderer.lineWidth = 2.f;
        renderer.strokeColor = [UIColor colorWithRed:0.f green:0.5f blue:1.f alpha:0.9f];
        return renderer;
    }
    return nil;
}


#pragma mark - Actions

- (void)showAlertWithTitle:(NSString*) title andMessage:(NSString*) message
{
    [[[UIAlertView alloc]
      initWithTitle:title
      message:message
      delegate:nil
      cancelButtonTitle:@"OK"
      otherButtonTitles:nil] show];
}

- (void)actionDescription:(UIButton*)sender
{
    MKAnnotationView* annotationView = [sender superAnnotationView];
    
    if (!annotationView)
    {
        return;
    }
    
    CLLocationCoordinate2D coordinate = annotationView.annotation.coordinate;
    
    CLLocation* location = [[CLLocation alloc] initWithLatitude:coordinate.latitude
                                                      longitude:coordinate.longitude];
    
    if ([self.geoCoder isGeocoding])
    {
        [self.geoCoder cancelGeocode];
    }
    
    [self.geoCoder
     reverseGeocodeLocation:location
     completionHandler:^(NSArray *placemarks, NSError *error){
         
         NSString* message = nil;
         
         if (error)
         {
             message = [error localizedDescription];
         }
         else
         {
             if ([placemarks count] > 0)
             {
                 MKPlacemark* placeMark = [placemarks firstObject];
                 
                 message = [placeMark.addressDictionary description];
                 
             }
             else
             {
                 message = @"No Placemarks Found";
             }
         }
         
         [self showAlertWithTitle:@"Location" andMessage:message];
     }];
    
}

- (void)actionDirection:(UIButton*)sender
{
    MKAnnotationView* annotationView = [sender superAnnotationView];
    
    if (!annotationView)
    {
        return;
    }
    
    if ([self.directions isCalculating])
    {
        [self.directions cancel];
    }
    
    CLLocationCoordinate2D coordinate = annotationView.annotation.coordinate;
    
    MKDirectionsRequest* request = [[MKDirectionsRequest alloc] init];
    
    request.source = [MKMapItem mapItemForCurrentLocation];
    
    MKPlacemark* placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
                                                   addressDictionary:nil];
    
    MKMapItem* destination = [[MKMapItem alloc] initWithPlacemark:placemark];
    
    request.destination = destination;
    
    request.transportType = MKDirectionsTransportTypeAutomobile;
    
    request.requestsAlternateRoutes = YES;
    
    self.directions = [[MKDirections alloc] initWithRequest:request];
    
    [self.directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error){
        
        if (error)
        {
            [self showAlertWithTitle:@"Error" andMessage:[error localizedDescription]];
        }
        else if ([response.routes count] == 0)
        {
            [self showAlertWithTitle:@"Error" andMessage:@"No routes found"];
        }
        else
        {
            [self.mapView removeOverlays:[self.mapView overlays]];
            
            NSMutableArray* array = [NSMutableArray array];
            
            for (MKRoute* route in response.routes)
            {
                [array addObject:route.polyline];
            }
            
            [self.mapView addOverlays:array level:MKOverlayLevelAboveRoads];
        }
        
    }];
}

@end
