//
//  BPEntryDataController.h
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BPEntry;

@interface BPEntryDataController : NSObject
@property (nonatomic, copy) NSMutableArray *masterBPEntriesList;
- (NSInteger)countOfList;
- (BPEntry *)objectInListAtIndex:(NSInteger)theIndex;
- (void)addBPEntryWithSystolic:(NSInteger)systolic diastolic:(NSInteger)diastolic pulse:(NSInteger)pulse date:(NSDate *)date;
@end
