//
//  PVLocationController.h
//  PlanVTT
//
//  Created by Thomas Dier on 05/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PVLocation;
@class PVHeading;

@interface PVLocationController : NSObject <CLLocationManagerDelegate> {
    CLLocationManager * _locationManager;
    NSMutableSet * _notifiedComponents;
    
    PVLocation * _lastLocation;
    PVHeading * _lastHeading;
    BOOL _headingIsLocked;
}

+ (PVLocationController *)getInstance;

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading;

- (void)startStandardUpdates;
- (void)stopStandardUpdates;

- (void)addNotifiedComponent:(id)component;
- (void)removeNotifiedComponent:(id)component;

@property (retain) CLLocationManager * locationManager;
@property (readonly) NSMutableSet * notifiedComponents;
@property (retain) PVLocation * lastLocation;
@property (retain) PVHeading * lastHeading;

@end
