//
//  VFLMetricsViewController.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 26/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.

//

#import "VFLMetricsViewController.h"

@interface VFLMetricsViewController ()

@end

@implementation VFLMetricsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Standard non-autolayout related setup.
    [self setTitle:@"VFL Metrics"];
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
    
    //Convenience function to create viewsDictionary
    NSDictionary *views = NSDictionaryOfVariableBindings(button1,button2);

    //Create our NSNumber variables for our metrics dictionary.
    NSNumber *bigSpace = [NSNumber numberWithInt:50];
    NSNumber *smallSpace = [NSNumber numberWithInt:2];
    
    //Create our metrics dictionary using our NSNumbers and strings
    NSDictionary *metrics = [NSDictionary dictionaryWithObjectsAndKeys: bigSpace, @"bigSpace", smallSpace, @"smallSpace", nil];
    
    //Layout the horizontal view using our metrics rather than hardcoded spaces
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-bigSpace-[button1(==button2)]-bigSpace-|" options:0 metrics:metrics views:views]];
    
   //Layout the vertical view using our metrics
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-bigSpace-[button1]-smallSpace-[button2(==button1)]-bigSpace-|" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
}

@end
