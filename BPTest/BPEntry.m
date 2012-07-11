//
//  BPEntry.m
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import "BPEntry.h"

@implementation BPEntry
@synthesize systolic = _systolic, diastolic = _diastolic, pulse = _pulse, date = _date;

- (id)initWithSystolic:(NSInteger)systolic diastolic:(NSInteger)diastolic pulse:(NSInteger)pulse date:(NSDate *)date {
    self = [super init];
    if (self) {
        _systolic = systolic;
        _diastolic = diastolic;
        _pulse = pulse;
        _date = date;
        return self;
    }
    return nil;
}

- (NSString *)bloodPressure {
    return [NSString stringWithFormat:@"%d/%d", self.systolic, self.diastolic];
}
@end
