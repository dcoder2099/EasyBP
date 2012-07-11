//
//  BPMasterViewController.h
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BPEntryDataController;

@interface BPMasterViewController : UITableViewController
@property (strong, nonatomic) BPEntryDataController *dataController;
@end
