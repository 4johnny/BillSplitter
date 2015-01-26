//
//  ViewController.m
//  BillSplitter
//
//  Created by Johnny on 2015-01-26.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "ViewController.h"


#define DEC_DIV(dec1, dec2) [dec1 decimalNumberByDividingBy:dec2]


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.splitPayAmountLabel.text = @"";
}


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


- (IBAction)calculatePressed {
	
	[self calculateSplitAmount];
}

@end
