//
//  VFLViewController2.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 26/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.

//

#import "VFLViewController2.h"

@interface VFLViewController2 ()

@end

@implementation VFLViewController2


- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    //Basic setup - not autoLayout related
    MKMapView *mapView = [[MKMapView alloc]init];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    [button1 setTitle:@"Button1" forState:UIControlStateNormal];
    [button2 setTitle:@"Button2" forState:UIControlStateNormal];
    [button3 setTitle:@"Button3" forState:UIControlStateNormal];
    [button4 setTitle:@"Button4" forState:UIControlStateNormal];
    
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    [[self view] addSubview:mapView];
    [[self view] addSubview:button1];
    [[self view] addSubview:button2];
    [[self view] addSubview:button3];
    [[self view] addSubview:button4];
    [self setTitle:@"Visual Format Lang 2"];
    
    //uses the provided convenience function to create NSDictionary of views with names as strings for use in constraintsWithVisualFormat
    //in viewDidLoad
    NSDictionary *views = NSDictionaryOfVariableBindings(mapView,button1,button2,button3,button4);
    
    //Prevent it trying to convert autoresizing mask into constraints which will conflict with our constraints
    [mapView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button4 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //set mapview to have system spacings between superview and itself at leading and trailing edges.
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[mapView]-|" options:0 metrics:nil views:views]];
    
    //set all buttons to be spaced with system spacing horizontally. Additionally set buttons 2-4 to be equal in width to button 1. Options sets all buttons to be centre aligned on Y axis
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button1]-[button2(==button1)]-[button3(==button1)]-[button4(==button1)]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    
    //Vertically sets system spacing, then mapview, then button 1 then system spacing. Options aligns leading edges of mapview and button 1
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[mapView]-[button1]-|" options:NSLayoutFormatAlignAllLeading metrics:nil views:views]];
    
    //Verticall set system spacing, then mapview, then button 4 then system spacing. Options aligns trailing edges of mapview and button 1.
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[mapView]-[button4]-|" options:NSLayoutFormatAlignAllTrailing metrics:nil views:views]];
    
}

@end
