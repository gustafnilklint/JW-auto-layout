//
//  InstrumentsViewController.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 26/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.

//

#import "InstrumentsViewController.h"

@interface InstrumentsViewController ()

@end

@implementation InstrumentsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Standard non-autolayout related setup
    [self setTitle:@"Instruments"];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"Button1" forState:UIControlStateNormal];
    [button2 setTitle:@"Button2" forState:UIControlStateNormal];
    [[self view] setBackgroundColor:[UIColor grayColor]];
    [[self view]addSubview:button1];
    [[self view]addSubview:button2];
    
    
    //Prevent from trying to layout subviews by converting autoresize masks into constraints
    [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //use convenience function to create dictionary of our views along with string equivelants to use in constraintsWithVisualFormat
    NSDictionary *views = NSDictionaryOfVariableBindings(button1,button2);
    
    //Horizontally set system spacings between either end of button1 and the superview. Set the width of button 1 equal to the width of button 2
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button1(==button2)]" options:0 metrics:nil views:views]];
    
    //Vertically set system spacings between superview and top of button 1/bottom of button2 and between the buttons. Set the height of button 2 equal to the height of button 1. Options sets the buttons to be centre aligned on the X axis.
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[button1]-[button2(==button1)]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
    
    //Add a target to the buttons, so that when one is pressed, another constraint is added - so this can be visualised in Instruments.
    [button1 addTarget:self action:@selector(addAnotherConstraint:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(addAnotherConstraint:) forControlEvents:UIControlEventTouchUpInside];

}
-(IBAction)addAnotherConstraint:(id)sender
{
    //Additional constraint which forces width of sender to be > = 200
    [sender addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[sender(>=200)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(sender)]];
    
}


@end
