//
//  PRViewController2.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 26/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.

//

#import "PRViewController2.h"

@interface PRViewController2 ()

//outlet from system created constraint in IB to enable us to remove it.
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sliderWidth;

//outlets to controls from IB
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;

//- (IBAction)touchUpdateButton:(UIButton *)sender;

@end

@implementation PRViewController2


- (void)viewDidLoad
{
    [super viewDidLoad];
    //Not autoLayout related
    [self setTitle:@"Primitive 2"];
    
    
    //Removes the constraint we created
    [[self slider]removeConstraint:[self sliderWidth]];
    
    //Adds a replacement constraint which sets the slider width euqal to the width of the messageTextView
    [[self view]addConstraint:[NSLayoutConstraint constraintWithItem:[self slider] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:[self messageTextView] attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    
}


@end
