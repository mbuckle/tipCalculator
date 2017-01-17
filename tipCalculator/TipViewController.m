//
//  ViewController.m
//  tipCalculator
//
//  Created by  Matthew Buckle on 1/11/17.
//  Copyright © 2017 Matthew Buckle. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (strong, nonatomic) IBOutlet UIView *tipView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"tip view did load");
    
    // Load default tip amount from stored data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tipDefaultAmountIndex = [defaults integerForKey:@"tipDefaultAmountIndex"];
    self.tipControl.selectedSegmentIndex = tipDefaultAmountIndex;
    
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"tip view will appear");
    
    // Add UIView animations to the tip view
    self.tipView.alpha = 0;
    [UIView animateWithDuration:0.4 animations:^{
        // This causes first view to fade in
        self.tipView.alpha = 1;
    } completion:^(BOOL finished) {
        // Do something here when the animation finishes.
    }];
    
    // Load default tip amount from Settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tipDefaultAmountIndex = [defaults integerForKey:@"tipDefaultAmountIndex"];
    self.tipControl.selectedSegmentIndex = tipDefaultAmountIndex;
    
    [self updateValues];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"tip view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"tip view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"tip view did disappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void) updateValues {
    // Get bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // Compute bill total
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    // Update UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

@end
