//
//  BPDetailViewController.m
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import "BPDetailViewController.h"
#import "BPEntry.h"

@interface BPDetailViewController ()
- (void)configureView;
@end

@implementation BPDetailViewController
@synthesize entry = _entry, systolicLabel = _systolicLabel, diastolicLabel = _diastolicLabel, pulseLabel = _pulseLabel, dateLabel = _dateLabel;

#pragma mark - Managing the detail item

- (void)setBPEntry:(id)newBPEntry
{
    if (_entry != newBPEntry) {
        _entry = newBPEntry;
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    BPEntry *theEntry = self.entry;
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
    }

    if (theEntry) {
        self.systolicLabel.text = [NSString stringWithFormat:@"%d", theEntry.systolic];
        self.diastolicLabel.text = [NSString stringWithFormat:@"%d", theEntry.diastolic];
        self.pulseLabel.text = [NSString stringWithFormat:@"%d", theEntry.pulse];
        self.dateLabel.text = [formatter stringFromDate:theEntry.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    self.entry = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
