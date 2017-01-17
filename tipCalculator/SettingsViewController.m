//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by  Matthew Buckle on 1/11/17.
//  Copyright © 2017 Matthew Buckle. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipDefault;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"settings view did load");
    
    // Load default tip amount from stored data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tipDefaultAmountIndex = [defaults integerForKey:@"tipDefaultAmountIndex"];
    self.tipDefault.selectedSegmentIndex = tipDefaultAmountIndex;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"settings view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"settings view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"settings view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"settings view did disappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self saveDefaults];
}

- (void) saveDefaults {
    // Get tip default amount index
    NSInteger tipDefaultAmountIndex = self.tipDefault.selectedSegmentIndex;
    
    // Save tip default amount index
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tipDefaultAmountIndex forKey:@"tipDefaultAmountIndex"];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
