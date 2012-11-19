//
//  HugcompViewController.h
//  IBAutoLayout
//
//  Created by Matt Tancock on 25/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HugcompViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UISlider *buttonComp;
@property (weak, nonatomic) IBOutlet UISlider *buttonHug;
@property (weak, nonatomic) IBOutlet UISlider *textComp;
@property (weak, nonatomic) IBOutlet UISlider *textHug;
@property (weak, nonatomic) IBOutlet UILabel *textCompLabel;

- (IBAction)buttonCompUpdate:(id)sender;
- (IBAction)buttonHugUpdate:(id)sender;
- (IBAction)textComUpdate:(id)sender;
- (IBAction)textHugUpdate:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *textHugLabel;
@property (weak, nonatomic) IBOutlet UILabel *buttonCompLabel;
@property (weak, nonatomic) IBOutlet UILabel *buttonHugLabel;

- (IBAction)pressButton:(id)sender;



@end
