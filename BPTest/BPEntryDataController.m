//
//  BPEntryDataController.m
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import "BPEntryDataController.h"
#import "BPEntry.h"

@interface BPEntryDataController ()
- (void)initializeDefaultDataList;
@end

@implementation BPEntryDataController
@synthesize masterBPEntriesList = _masterBPEntriesList;
- (void)initializeDefaultDataList {
    NSMutableArray *entryList = [[NSMutableArray alloc] init];
    self.masterBPEntriesList = entryList;
}
- (void)setMasterBPEntriesList:(NSMutableArray *)newList {
    if (_masterBPEntriesList != newList) {
        _masterBPEntriesList = [newList mutableCopy];
    }
}
- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (NSInteger)countOfList {
    return [self.masterBPEntriesList count];
}

- (BPEntry *)objectInListAtIndex:(NSInteger)theIndex {
    return [self.masterBPEntriesList objectAtIndex:theIndex];
}

- (void)addBPEntryWithSystolic:(NSInteger)systolic diastolic:(NSInteger)diastolic pulse:(NSInteger)pulse date:(NSDate *)date {
    BPEntry *entry;
    entry = [[BPEntry alloc] initWithSystolic:systolic diastolic:diastolic pulse:pulse date:date];
    [self.masterBPEntriesList addObject:entry];
}

@end
