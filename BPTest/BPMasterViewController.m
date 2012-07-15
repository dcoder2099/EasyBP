//
//  BPMasterViewController.m
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import "BPMasterViewController.h"
#import "BPDetailViewController.h"
#import "BPEntryDataController.h"
#import "BPEntry.h"
#import "AddBPEntryViewController.h"

@interface BPMasterViewController () <AddBPEntryViewControllerDelegate>
@end

@implementation BPMasterViewController
@synthesize dataController = _dataController;


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BPEntryCell";
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    BPEntry *entryAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:entryAtIndex.bloodPressure];
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)entryAtIndex.date]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowBPEntryDetails"]) {
        BPDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.entry = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    } else if ([[segue identifier] isEqualToString:@"ShowAddBPEntryView"]) {
        AddBPEntryViewController *addController = (AddBPEntryViewController *)[[[segue destinationViewController] viewControllers] objectAtIndex:0];
        addController.delegate = self;
    }
}

-(void)addBPEntryViewControllerDidCancel:(AddBPEntryViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)addBPEntryViewControllerDidFinish:(AddBPEntryViewController *)controller systolic:(NSInteger)systolic diastolic:(NSInteger)diastolic pulse:(NSInteger)pulse date:(NSDate *)date {
    if ((systolic > 0) && (diastolic > 0) && (pulse > 0)) {
        [self.dataController addBPEntryWithSystolic:systolic diastolic:diastolic pulse:pulse date:date];
        [[self tableView] reloadData];
    }
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
