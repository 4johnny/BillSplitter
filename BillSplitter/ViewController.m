//
//  ViewController.m
//  BillSplitter
//
//  Created by Johnny on 2015-01-26.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "ViewController.h"


#
# pragma mark - Constants
#

#define SLIDER_INCREMENT	1


#
# pragma mark - Macros
#

#define DEC_DIV(dec1, dec2) [dec1 decimalNumberByDividingBy:dec2]


#
# pragma mark - Interface
#


@interface ViewController ()

@end


#
# pragma mark - Implementation
#


@implementation ViewController


#
# pragma mark - UIViewController
#

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.billAmountTextField.delegate = self;
	self.splitPayAmountLabel.text = @"";
}


#
# pragma mark - UIResponder
#


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	[self.view endEditing:YES];
	[super touchesBegan:touches withEvent:event];
}


#
# pragma mark - UITextFieldDelegate
#


-(void)textFieldDidEndEditing:(UITextField *)textField {
	
	[self calculateSplitAmount];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[self.view endEditing:YES];
	return YES;
}


#
# pragma mark - Action Handlers
#


- (IBAction)calculatePressed {
	
	[self.view endEditing:YES];
	[self calculateSplitAmount];
}


- (IBAction)splitCountChanged {
	
	[self.view endEditing:YES];
	
	int splitCount = ((int)((self.splitCountSlider.value + SLIDER_INCREMENT / 2.0) / SLIDER_INCREMENT) * SLIDER_INCREMENT);
	
	[self.splitCountSlider setValue:splitCount animated:YES];
	
	[self calculateSplitAmount];
}


#
# pragma mark - Logic
#


- (void)calculateSplitAmount {
	
	NSNumberFormatter* nf = [[NSNumberFormatter alloc] init];
	nf.formatterBehavior = NSNumberFormatterDecimalStyle;
	nf.currencyCode = @"CAD";
	nf.currencySymbol = @"$";
	nf.minimumFractionDigits = (nf.maximumFractionDigits = 2);
	
	NSDecimalNumber* billAmount = [NSDecimalNumber decimalNumberWithDecimal:[nf numberFromString:self.billAmountTextField.text].decimalValue];
	
	NSDecimalNumber* splitCount = [[NSDecimalNumber alloc] initWithFloat:self.splitCountSlider.value];
	
	NSDecimalNumber* splitPayAmount = DEC_DIV(billAmount, splitCount);
	//	NSDecimalNumber* splitPayAmount = [billAmount decimalNumberByDividingBy:splitCount];
	
	self.splitPayAmountLabel.text = [nf stringFromNumber:splitPayAmount];
}


@end
