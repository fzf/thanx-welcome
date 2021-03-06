//
//  THXBeacon.m
//  ThanxWelcome
//
//  Created by Marc Fernandez on 5/9/14.
//  Copyright (c) 2014 Thanx. All rights reserved.
//

#import "THXBeaconManager.h"

static NSString *THXBeaconsUUID = @"B9407F30-F5F8-466E-AFF9-25556B57FE6D"; // @todo: change UUID for beacons

@implementation THXBeaconManager

- (id)init {
  self = [super init];
  if (self) {
    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;

    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:THXBeaconsUUID];
    ESTBeaconRegion* region = [[ESTBeaconRegion alloc] initWithProximityUUID:uuid
                                                                  identifier:@"ThanxOffice"];

    // start looking for estimtoe beacons in region
    // when beacon ranged beaconManager:didRangeBeacons:inRegion: invoked
    [self.beaconManager startRangingBeaconsInRegion:region];
  }
  return self;
}

-(void)beaconManager:(ESTBeaconManager *)manager
     didRangeBeacons:(NSArray *)beacons
            inRegion:(ESTBeaconRegion *)region {

  if(beacons.count > 0) {
    // beacon array is sorted based on distance
    // closest beacon is the first one
    THXBeacon* closestBeacon = (THXBeacon *)[beacons objectAtIndex:0];
    // @todo: This only would detect the closest iBeacon
    //if (((THXBeacon *)closestBeacon).hasBeenDetectedSoon) return;

    // calculate and set new y position
    switch (closestBeacon.proximity) {
      case CLProximityUnknown:

      break;
      case CLProximityImmediate:

      break;
      case CLProximityNear:
        //((THXBeacon *)closestBeacon).lastTimeDetected = NSDate.date;
      break;
      case CLProximityFar:
      break;

      default:
      break;
    }
  }
}

@end
