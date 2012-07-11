//
//  AddBPEntryViewController.h
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddBPEntryViewControllerDelegate;

@interface AddBPEntryViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) id <AddBPEntryViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *systolicInput;
@property (weak, nonatomic) IBOutlet UITextField *diastolicInput;
@property (weak, nonatomic) IBOutlet UITextField *pulseInput;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@end

@protocol AddBPEntryViewControllerDelegate <NSObject>
- (void)addBPEntryViewControllerDidCancel:(AddBPEntryViewController *)controller;
- (void)addBPEntryViewControllerDidFinish:(AddBPEntryViewController *)controller systolic:(NSInteger)systolic diastolic:(NSInteger)diastolic pulse:(NSInteger)pulse;
@end