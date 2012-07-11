//
//  BPEntry.h
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPEntry : NSObject
@property (nonatomic) NSInteger systolic;
@property (nonatomic) NSInteger diastolic;
@property (nonatomic) NSInteger pulse;
@property (nonatomic, strong) NSDate *date;
- (id)initWithSystolic:(NSInteger)systolic diastolic:(NSInteger)diastolic pulse:(NSInteger)pulse date:(NSDate *)date;
- (NSString *)bloodPressure;
@end
