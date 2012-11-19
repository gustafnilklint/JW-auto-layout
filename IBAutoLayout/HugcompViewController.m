//
//  HugcompViewController.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 25/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.
//

#import "HugcompViewController.h"

@interface HugcompViewController ()

@end

@implementation HugcompViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	  
    [self setTitle:@"Hugs & Compression"];
    
    [[self textfield]addTarget:self action:@selector(removeKeyboard) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //Sets the sliders values to be the current contentCompressionResistance and HuggingPriority on horizontalAccess 
    
    [[self buttonComp]setValue:[[self button1]contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisHorizontal ]];
    [[self buttonHug]setValue:[[self button1]contentHuggingPriorityForAxis:UILayoutConstraintAxisHorizontal ]];
    [[self textComp]setValue:[[self textComp]contentCompressionResistancePriorityForAxis:UILayoutConstraintAxisHorizontal ]];
    [[self textHug]setValue:[[self textComp]contentHuggingPriorityForAxis:UILayoutConstraintAxisHorizontal ]];
    
    //Sets up text labels
    [[self textCompLabel] setText:[NSString stringWithFormat:@"%.1f",[[self textComp]value]]];
    [[self textHugLabel] setText:[NSString stringWithFormat:@"%.1f",[[self textHug]value]]];
    [[self buttonCompLabel] setText:[NSString stringWithFormat:@"%.1f",[[self buttonComp]value]]];
    [[self buttonHugLabel] setText:[NSString stringWithFormat:@"%.1f",[[self buttonHug]value]]];

}


- (IBAction)pressButton:(id)sender {
    
    //Update button caption
    [[self button1]setTitle:[self textfield].text forState:UIControlStateNormal];
    
    //dismiss keyboard
    [[self view]endEditing:YES];
}
- (IBAction)buttonCompUpdate:(id)sender {
    
    //When slider is slid, adjust contentCompressionResistancePriority for button
    [[self button1]setContentCompressionResistancePriority:[[self buttonComp] value] forAxis:UILayoutConstraintAxisHorizontal];
    [[self buttonCompLabel] setText:[NSString stringWithFormat:@"%.1f",[[self buttonComp]value]]];
}

- (IBAction)buttonHugUpdate:(id)sender {
    
    //when slider is slid, adjust contentHuggingPriority for button
    [[self button1]setContentHuggingPriority:[[self buttonHug] value] forAxis:UILayoutConstraintAxisHorizontal];
    [[self buttonHugLabel] setText:[NSString stringWithFormat:@"%.1f",[[self buttonHug]value]]];
}

- (IBAction)textComUpdate:(id)sender {
    
    //when slider is slid, adjust contentCompressionResistancePriority for textField
    [[self textfield]setContentCompressionResistancePriority:[[self textComp] value] forAxis:UILayoutConstraintAxisHorizontal];
    [[self textCompLabel] setText:[NSString stringWithFormat:@"%.1f",[[self textComp]value]]];
}

- (IBAction)textHugUpdate:(id)sender {
    
    //when slider is slid, adjust contentHuggingPriority for textField
    [[self textfield]setContentHuggingPriority:[[self textHug] value] forAxis:UILayoutConstraintAxisHorizontal];
    [[self textHugLabel] setText:[NSString stringWithFormat:@"%.1f",[[self textHug]value]]];
}

-(IBAction)removeKeyboard
{
    [self.textfield resignFirstResponder];
}

@end
