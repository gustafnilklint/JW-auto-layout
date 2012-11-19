//
//  VFLViewController3.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 26/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.

//

#import "VFLViewController3.h"

@interface VFLViewController3 ()

@end

@implementation VFLViewController3


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Standard non-autolayout related setup
    [self setTitle:@"Visual Format Lang 3"];
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *fastForwardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *rewindButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *skipForwardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *skipBackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIView *buttonContainer = [[UIView alloc]init];
    UIView * controlContainer = [[UIView alloc] init];
    UISlider *volumeSlider = [[UISlider alloc]init];
    UISlider *videoProgress = [[UISlider alloc]init];
    UILabel *timeProgressLabel = [[UILabel alloc]init];
    UILabel *timeRemainingLabel = [[UILabel alloc]init];
    
    [playButton setTitle:@">" forState:UIControlStateNormal];
    [skipBackButton setTitle:@"|<" forState:UIControlStateNormal];
    [rewindButton setTitle:@"<<" forState:UIControlStateNormal];
    [fastForwardButton setTitle:@">>" forState:UIControlStateNormal];
    [skipForwardButton setTitle:@">|" forState:UIControlStateNormal];
    [[self view]addSubview:controlContainer];
    [buttonContainer setBackgroundColor:[UIColor darkGrayColor]];
    [[self view]setBackgroundColor:[UIColor blackColor]];
    [controlContainer setBackgroundColor:[UIColor lightGrayColor]];
    [volumeSlider setMaximumValue:11.0];
    [volumeSlider setMinimumValue:0.0];
    [videoProgress setMinimumValue:0.0];
    [videoProgress setMaximumValue:100.0];
    [timeProgressLabel setText:@"43:59"];
    [timeRemainingLabel setText:@"90:13"];
    [volumeSlider setValue:4.0];
    [videoProgress setValue:42.0];
    [timeProgressLabel setBackgroundColor:[UIColor clearColor]];
    [timeRemainingLabel setBackgroundColor:[UIColor clearColor]];
    [controlContainer addSubview:buttonContainer];
    [buttonContainer addSubview:playButton];
    [buttonContainer addSubview:fastForwardButton];
    [buttonContainer addSubview:rewindButton];
    [buttonContainer addSubview:skipBackButton];
    [buttonContainer addSubview:skipForwardButton];
    [controlContainer addSubview:volumeSlider];
    [controlContainer addSubview:videoProgress];
    [controlContainer addSubview:timeRemainingLabel];
    [controlContainer addSubview:timeProgressLabel];
    
    
    
    //Turn off autoresizemasks
    [playButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [fastForwardButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [rewindButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [skipForwardButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [skipBackButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [controlContainer setTranslatesAutoresizingMaskIntoConstraints:NO];
    [volumeSlider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [videoProgress setTranslatesAutoresizingMaskIntoConstraints:NO];
    [timeProgressLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [timeRemainingLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
 
    //Uses convenience function to create NSDictionary of views for use in constraintsWithVisualFormat. In this case we include everything. It doesn't matter if views are included that are not used in a particular constraint.
    NSDictionary *views = NSDictionaryOfVariableBindings(buttonContainer,controlContainer,playButton,fastForwardButton,rewindButton,skipBackButton, skipForwardButton, volumeSlider, videoProgress,timeProgressLabel, timeRemainingLabel);
    
    //controlbar fills screen with standard spacers at either edge
    [[self view]addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[controlContainer]-|" options:0 metrics:nil views:views]];
    
    //controlbar is hardcoded to 110 high, with standard spacer at bottom
    [[self view]addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[controlContainer(110)]-|" options:0 metrics:nil views:views]];
    
    //controlbar has standard space, then volumeslider which can vary between 60 and 120 wide, then space of 20 with a priority of 250. Then the button constainer, Then a space of 20 with a priority of 249 to indicate that if a constraint needs breaking, this should be the one First! The two controls are top aligned.
      [controlContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[volumeSlider(>=60,<=120)]-20@250-[buttonContainer]-20@249-|" options:NSLayoutFormatAlignAllTop metrics:nil views:views]];
    
    //Creating a constraint to centre buttonconstainer with control panel horizontally.
    NSLayoutConstraint *centreButtons = [NSLayoutConstraint constraintWithItem:buttonContainer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:controlContainer attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  
    //set the priority of this constraint as low, so that if it's not possible to centre (e.g in portrait) it falls back to other constraints. If it is possible however, this priority is slightly higher than other constraints which would cause conflicts.
    [centreButtons setPriority:UILayoutPriorityDefaultLow];
    
    //add the centering constraint
    [controlContainer addConstraint:centreButtons];
    
    //videoprogress bar is above standard space which is above timeprogress label. The leading edges of the two are aligned. Timeprogresslabel has a standard space below and then edge of superview
    [controlContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[videoProgress][timeProgressLabel]|" options:NSLayoutFormatAlignAllLeading metrics:nil views:views]];
    
    //as above but with timeremaininglabel and trailing edges are aligned.
     [controlContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[videoProgress][timeRemainingLabel]|" options:NSLayoutFormatAlignAllTrailing metrics:nil views:views]];
    
    
    //control bar has small space at top, then buttoncontainer, then standard sized space, then video progress bar. This isn't combined with constraints above because of wanting to align left/right edges of labels.
    [controlContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[buttonContainer]-[videoProgress]" options:0 metrics:nil views:views]];
    
    //the video progress bar fills the controlbar horizontally with standard sized space at each end.
    [controlContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[videoProgress]-|" options:0 metrics:nil views:views]];
    
    //the button container contains 5 buttons, the first has a hardcoded size, the other 4 are all set to equal the first. Buttons are seperated by standard size spaces with no space at either end between superview and first/last button.
    [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[skipBackButton(==25)]-[rewindButton(==skipBackButton)]-[playButton(==skipBackButton)]-[fastForwardButton(==skipBackButton)]-[skipForwardButton(==skipBackButton)]|" options:NSLayoutFormatAlignAllTop metrics:nil views:views]];
    
    //there is probably a more elegant way of doing this, but interestingly IB does exactly the same thing if you select a number of controls and set their heights/widths equal to each other. These 5 constraints set the height of buttons. First hardcodes, the other 4 set themselves equal to the first.
    [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[skipForwardButton(==25)]|" options:0 metrics:nil views:views]];
    [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[fastForwardButton(==skipForwardButton)]|" options:0 metrics:nil views:views]];
    [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[skipBackButton(==skipForwardButton)]|" options:0 metrics:nil views:views]];
    [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[playButton(==skipForwardButton)]|" options:0 metrics:nil views:views]];
    [buttonContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rewindButton(==skipForwardButton)]|" options:0 metrics:nil views:views]];
    


}


@end
