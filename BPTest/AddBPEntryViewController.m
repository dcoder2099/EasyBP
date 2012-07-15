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
@synthesize dateButton = _dateButton;
@synthesize pickerView = _pickerView;
@synthesize formatter = _formatter;
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
    self.formatter = [[NSDateFormatter alloc] init];
    [self.formatter setDateStyle:NSDateFormatterShortStyle];
    [self.formatter setTimeStyle:NSDateFormatterShortStyle];

    [self.dateButton setTitle:[self.formatter stringFromDate:[NSDate date]] forState:UIControlStateNormal];
    [self.pickerView setDate:[NSDate date]];
    [self.pickerView setHidden:YES];
    [self.systolicInput becomeFirstResponder];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setSystolicInput:nil];
    [self setDiastolicInput:nil];
    [self setPulseInput:nil];
    [self setDateButton:nil];
    [self setPickerView:nil];
    [self setFormatter:nil];
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
    // Note, we're using the pickerView's date, but we might want to use
    // the button's title instead. If we do that, we'll have to use the
    // formatter to parse the string into an NSDate.
    [[self delegate] addBPEntryViewControllerDidFinish:self systolic:self.systolicInput.text.integerValue diastolic:self.diastolicInput.text.integerValue pulse:self.pulseInput.text.integerValue date:self.pickerView.date];
}

- (IBAction)showDatePicker:(id)sender {
    [self.systolicInput resignFirstResponder];
    [self.diastolicInput resignFirstResponder];
    [self.pulseInput resignFirstResponder];
    [self.pickerView setHidden:NO];
}

- (IBAction)datePickerChanged:(id)sender {
    [self.dateButton setTitle:[self.formatter stringFromDate:self.pickerView.date] forState:UIControlStateNormal];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.systolicInput) || (textField == self.diastolicInput) || (textField == self.pulseInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.pickerView setHidden:YES];
    return YES;
}
@end
