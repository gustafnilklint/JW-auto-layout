//
//  DbViewController1.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 26/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.

//

#import "DbViewController1.h"

@interface DbViewController1 ()

@end

@implementation DbViewController1



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Standard non-autoLayout related setup
    [self setTitle:@"Debugging 1"];
    [[self view]setBackgroundColor:[UIColor whiteColor]];
    UIButton *button1 = [[UIButton alloc]init];
    UIButton *button2 = [[UIButton alloc] init];
    UIButton *button3 = [[UIButton alloc] init];
    
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 setTitle:@"Button1" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor blueColor]];
    [button2 setTitle:@"Button2" forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor greenColor]];
    [button3 setTitle:@"Button3" forState:UIControlStateNormal];
    
    [[self view]addSubview:button1];
    [[self view]addSubview:button2];
    [[self view]addSubview:button3];
    
    
    //adds a selector to each button allowing you to see the effects of ambiguous layout.
    
    [button1 addTarget:self action:@selector(ambiguous:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(ambiguous:) forControlEvents:UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(ambiguous:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // This seems to be annoyingly necessary when doing anything in code - you need to set every single view like this or system will add it's own constraints which can mess with your constraints. If you don't do this, when you are debuggin you may see constraints like <NSAutoresizingMaskLayoutConstraint:0xdc48240 h=--& v=--& UIButton:0xdc32a30.midX ==>. These are constraints added by the translating of autoresizing and usually indicate you didn't turn this property off - or there's some other view involved which you weren't aware of!

    [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    //This is the convenience method which creates an NSDictionary using the variable names as the strings for constraintWithVisualFormat. If you don't want to use the variable names as the strings, you'll have to construct the dictionary yourself!
    
    NSDictionary *views = NSDictionaryOfVariableBindings(button1, button2, button3);

    //This adds a number of constraints. It sets standard (system) spaces between each button (horizontally) as well as between the left of the first button and superview, and the right of the last button and superview. It also (via the options) aligns the baseline of each button.
    [[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[button1]-[button2]-[button3]-|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views]];
    
    //this sets the height of button1 to be equal to button2, and sets a standard width between the top of the superview and button1.
    [[self view]addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[button1(==button2)]" options:0 metrics:nil views:views]];
    
    //this sets the height of button2 to be equal to button3
    [[self view]addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button2(==button3)]" options:0 metrics:nil views:views]];
  
}



-(IBAction)ambiguous:(id)sender
{
    //this method calls the exerciseAmbiguityInLayout which cycles through different possible layouts, where all satisfy the constraints. Apple say it shouldn't be used in production and is for debugging only!

    if ([sender hasAmbiguousLayout])
    {
     NSLog(@"%@ has ambiguous layout", sender);
        [sender exerciseAmbiguityInLayout]; }

   
}


@end
