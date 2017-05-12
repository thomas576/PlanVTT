//
//  PVLocationController.m
//  PlanVTT
//
//  Created by Thomas Dier on 05/07/11.
//  Copyright 2011 none. All rights reserved.
//

#import "PVLocationController.h"
#import "PVConstants.h"
#import "PVLocationAwareComponents.h"
#import "PVHeadingAwareComponents.h"
#import "PVHeading.h"
#import "PVLocation.h"
#import "PVAngle.h"
#import "PVSuperAngle.h"
#import "PVAngleScreen.h"
#import "PVAngleMagnetic.h"
#import "PVAngleGeographic.h"

@implementation PVLocationController

static PVLocationController * singleton = nil;

- (id)init {
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager release];
        
        _notifiedComponents = [[NSMutableSet alloc] initWithCapacity:2];
        
        _lastLocation = nil;
        _lastHeading = nil;
        _headingIsLocked = NO;
    }
    return self;
}

+ (PVLocationController *)getInstance {
    if (singleton == nil) {
        singleton = [[PVLocationController alloc] init];
    }
    return singleton;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{
    NSAutoreleasePool * poolLocationEvent = [[NSAutoreleasePool alloc] init];
    
    // Si la precision est pas OK, on fait rien.
    if (newLocation.horizontalAccuracy < 0) {
        return;
    } else {
        // On envoie la nouvelle position.
        PVLocation * location = [[PVLocation alloc] initWithLocation:newLocation];
        self.lastLocation = location;
        
        for (id<PVLocationAwareComponents> component in self.notifiedComponents) {
            [component locationDidChangeTo:location];
        }
        
        // Si le "course" est valable, on l'utilise comme heading. Il y a plusieurs critères à vérifier :
        NSTimeInterval howRecent = abs([location.timestamp timeIntervalSinceNow]);
        PVHeading * newCourseHeading = [[PVHeading alloc] initWithAngle:location.course andAccuracy:1.0];
        double differenceInDegrees;
        if (self.lastHeading == nil) {
            differenceInDegrees = 0.0;
        } else {
            differenceInDegrees = fabs(newCourseHeading.heading.angleGeographic.degrees - self.lastHeading.heading.angleGeographic.degrees);
        }
        if (howRecent < 5.0 && differenceInDegrees < 75.0 && location.speed > 1.0) {
            
            // On envoie le course en heading
            for (id<PVHeadingAwareComponents> component in self.notifiedComponents) {
                [component headingDidChangeTo:newCourseHeading];
            }
            _headingIsLocked = YES;
            
        } else {
            //On "unlock" le heading
            _headingIsLocked = NO;
        }
        
        [newCourseHeading release];
        [location release];
    }
    
    [poolLocationEvent release];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading 
{
    // Si la precision est pas OK, on fait rien.
    if (newHeading.headingAccuracy < 0) {
        return;
    } else {
        PVHeading * heading = [[PVHeading alloc] initWithHeading:newHeading];
        self.lastHeading = heading;
        
        // Si le heading est "locked" on cherche à voir si on peut le unlocker
        if (_headingIsLocked == YES) {
            
            // On vérifie que le "course" n'est pas valable, sinon on ne fait rien.
            if (self.lastLocation == nil) {
                
                for (id<PVHeadingAwareComponents> component in self.notifiedComponents) {
                    [component headingDidChangeTo:heading];
                }
                _headingIsLocked = NO;
                
            } else {
                NSTimeInterval howRecent = abs([self.lastLocation.timestamp timeIntervalSinceNow]);
                PVHeading * lastCourseHeading = [[PVHeading alloc] initWithAngle:self.lastLocation.course andAccuracy:1.0];
                double differenceInDegrees = fabs(heading.heading.angleGeographic.degrees - lastCourseHeading.heading.angleGeographic.degrees);
                if (!(howRecent < 5.0 && differenceInDegrees < 75.0 && self.lastLocation.speed > 1.0))
                    
                    for (id<PVHeadingAwareComponents> component in self.notifiedComponents) {
                        [component headingDidChangeTo:heading];
                    }
                    _headingIsLocked = NO;
                
                [lastCourseHeading release];
            }
        } else {
            // Si le heading est "unlocked", on envoie le nouveau heading
            for (id<PVHeadingAwareComponents> component in self.notifiedComponents) {
                [component headingDidChangeTo:heading];
            }
        }
        
        [heading release];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{
    UIAlertView * alert = [[[UIAlertView alloc] initWithTitle:@"Localisation" message:[error localizedDescription] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease];
    
    [alert show];
    
    [self stopStandardUpdates];
    [self performSelector:@selector(startStandardUpdates) withObject:self afterDelay:20.0]; // en secondes
}

- (void)startStandardUpdates
{
    //NSLog(@"startStandardUpdates");
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Set a movement threshold for new events.
    self.locationManager.distanceFilter = [PVConstants minimumDistanceFilter];
    [self.locationManager startUpdatingLocation];
    
    self.locationManager.headingFilter = [PVConstants minimumHeadingFilter];
    [self.locationManager startUpdatingHeading];
}

- (void)stopStandardUpdates {
    //NSLog(@"stopStandardUpdates");
    [self.locationManager stopUpdatingHeading];
    [self.locationManager stopUpdatingLocation];
}

- (void)addNotifiedComponent:(id)component {
    [self.notifiedComponents addObject:component];
}

- (void)removeNotifiedComponent:(id)component {
    [self.notifiedComponents removeObject:component];
}

- (void)dealloc {
    [_locationManager release];
    [_notifiedComponents release];
    [_lastHeading release];
    [_lastLocation release];
    [super dealloc];
}

@synthesize locationManager = _locationManager;
@synthesize notifiedComponents = _notifiedComponents;
@synthesize lastHeading = _lastHeading;
@synthesize lastLocation = _lastLocation;

@end
