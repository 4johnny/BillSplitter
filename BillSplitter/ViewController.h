//
//  ViewController.h
//  BillSplitter
//
//  Created by Johnny on 2015-01-26.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *splitCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *splitPayAmountLabel;

@end

