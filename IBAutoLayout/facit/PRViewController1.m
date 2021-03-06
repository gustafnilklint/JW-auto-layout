//
//  PRViewController1.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 26/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.
//

#import "PRViewController1.h"

@interface PRViewController1 ()

@end

@implementation PRViewController1


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Basic setup - not autoLayout related
    [self setTitle:@"Primitive 1"];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [[self view] setBackgroundColor:[UIColor grayColor]];
    [button1 setTitle:@"Button1" forState:UIControlStateNormal];
    [button2 setTitle:@"Button2" forState:UIControlStateNormal];
    [[self view]addSubview:button1];
    [[self view]addSubview:button2];
    
    
    //As we're not using IB need to tell it not to try and lay these itself.
    //in viewDidLoad
    [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
        
    
   
    //Set leading edge of button1 equal to leading edge of superview + 20
    [[self view]addConstraint:[NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0]];
   
    //Set trailing edge of button 1 equal to trailing edge of superview -20 (sign is important!)
    [[self view]addConstraint:[NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20.0]];
    
    //Set top of button1 equal to top of superview +20
     [[self view]addConstraint:[NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0]];
    
    //set bottom of button 2 equal to bottom of superview - 20
     [[self view]addConstraint:[NSLayoutConstraint constraintWithItem:button2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20.0]];
    
    //set leading edge of button2 equal to leading edge of superview + 20
    [[self view]addConstraint:[NSLayoutConstraint constraintWithItem:button2 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20.0]];
    
    
    //set bottom edge of button1 equal to top edge of button2 - 8
     [[self view]addConstraint:[NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:button2 attribute:NSLayoutAttributeTop multiplier:1.0 constant:-8.0]];
    
    //set button1 width equal to button2 width
     [[self view]addConstraint:[NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:button2 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
   
    //set button1 height equal to button2 height
    [[self view]addConstraint:[NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:button2 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    
    
    
    
}


@end
