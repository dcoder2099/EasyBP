//
//  AddBPEntryViewController.m
//  BPTest
//
//  Created by Daniel Hedrick on 7/8/12.
//  Copyright (c) 2012 DLH. All rights reserved.
//

#import "AddBPEntryViewController.h"

@interface AddBPEntryViewController ()

@end

@implementation AddBPEntryViewController
@synthesize systolicInput = _systolicInput;
@synthesize diastolicInput = _diastolicInput;
@synthesize pulseInput = _pulseInput;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setSystolicInput:nil];
    [self setDiastolicInput:nil];
    [self setPulseInput:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)cancel:(id)sender {
    [[self delegate] addBPEntryViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    [[self delegate] addBPEntryViewControllerDidFinish:self systolic:self.systolicInput.text.integerValue diastolic:self.diastolicInput.text.integerValue pulse:self.pulseInput.text.integerValue];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.systolicInput) || (textField == self.diastolicInput) || (textField == self.pulseInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}
@end
