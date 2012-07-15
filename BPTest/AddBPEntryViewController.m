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

- (void)awakeFromNib
{
    // The pickerView is embedded in the DatePickerUI.xib file, so we load the Nib,
    // grab it's only object (the picker), and assign it to the pickerView ivar.
    self.pickerView = [[[NSBundle mainBundle] loadNibNamed:@"DatePickerUI" owner:self options:nil] objectAtIndex:0];
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    self.formatter = [[NSDateFormatter alloc] init];
    [self.formatter setDateStyle:NSDateFormatterShortStyle];
    [self.formatter setTimeStyle:NSDateFormatterShortStyle];

    [self.dateButton setTitle:[self.formatter stringFromDate:[NSDate date]] forState:UIControlStateNormal];
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
    [self hideDatePicker];
    [[self delegate] addBPEntryViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    // Note, we're using the pickerView's date, but we might want to use
    // the button's title instead. If we do that, we'll have to use the
    // formatter to parse the string into an NSDate.
    [self hideDatePicker];
    [[self delegate] addBPEntryViewControllerDidFinish:self systolic:self.systolicInput.text.integerValue diastolic:self.diastolicInput.text.integerValue pulse:self.pulseInput.text.integerValue date:[self.formatter dateFromString:self.dateButton.titleLabel.text]];
}

- (IBAction)showDatePicker:(id)sender {
    self.pickerView.date = [self.formatter dateFromString:self.dateButton.titleLabel.text];

	if (self.pickerView.superview == nil) {
        // make any existing controls resign the keyboard.
        [self.systolicInput resignFirstResponder];
        [self.diastolicInput resignFirstResponder];
        [self.pulseInput resignFirstResponder];
		[self.view.window addSubview: self.pickerView];
        // compute start frame.
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        CGSize pickerSize = [self.pickerView sizeThatFits:CGSizeZero];
        CGRect startRect = CGRectMake(0.0, 
                                      screenRect.origin.y + screenRect.size.height,
                                      pickerSize.width, pickerSize.height);
        self.pickerView.frame = startRect;
        
        // compute end frame.
        CGRect pickerRect = CGRectMake(0.0, 
                                       screenRect.origin.y + screenRect.size.height - pickerSize.height,
                                       pickerSize.width, pickerSize.height);
        
        // start slide-up animaction
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelegate:self];
        self.pickerView.frame = pickerRect;
        CGRect newFrame = self.tableView.frame;
        newFrame.size.height -= self.pickerView.frame.size.height;
        self.tableView.frame = newFrame;
        [UIView commitAnimations];
    }
}

- (void)hideDatePicker {
    if (self.pickerView.superview != nil) {
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        CGRect endFrame = self.pickerView.frame;
        endFrame.origin.y = screenRect.origin.y + screenRect.size.height;
        
        // start the slide down animation
        [UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3];
        
		// we need to perform some post operations after the animation is complete
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(slideDownDidStop)];
        
		self.pickerView.frame = endFrame;
        [UIView commitAnimations];
        
        // grow the table back again in vertical size to make room for the date picker
        CGRect newFrame = self.tableView.frame;
        newFrame.size.height += self.pickerView.frame.size.height;
        self.tableView.frame = newFrame;
    }
}
- (IBAction)datePickerChanged:(id)sender {
    [self.dateButton setTitle:[self.formatter stringFromDate:self.pickerView.date] forState:UIControlStateNormal];
}

- (void)slideDownDidStop {
	// the date picker has finished sliding downwards, so remove it
	[self.pickerView removeFromSuperview];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.systolicInput) || (textField == self.diastolicInput) || (textField == self.pulseInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self hideDatePicker];
    return YES;
}
@end
