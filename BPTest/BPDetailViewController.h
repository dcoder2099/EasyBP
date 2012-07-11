//
//  BPDetailViewController.h
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BPEntry;

@interface BPDetailViewController : UITableViewController
@property (strong, nonatomic) BPEntry *entry;
@property (weak, nonatomic) IBOutlet UILabel *systolicLabel;
@property (weak, nonatomic) IBOutlet UILabel *diastolicLabel;
@property (weak, nonatomic) IBOutlet UILabel *pulseLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end
