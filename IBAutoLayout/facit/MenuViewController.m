//
//  MenuViewController.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 26/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.

//

#import "MenuViewController.h"

#import "IBViewController1.h"
#import "IBViewController2.h"
#import "DbViewController1.h"
#import "PRViewController2.h"
#import "VFLViewController1.h"
#import "VFLViewController2.h"
#import "VFLViewController3.h"
#import "PRViewController1.h"
#import "VFLMetricsViewController.h"
#import "InstrumentsViewController.h"
#import "HugcompViewController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

//Menu

- (IBAction)ib1:(id)sender {
    IBViewController1 *vc1 = [[IBViewController1 alloc] initWithNibName:@"IBViewController1" bundle:nil];
    [[self navigationController]pushViewController:vc1 animated:YES];
}

- (IBAction)ib2:(id)sender {
    IBViewController2 *vc2 = [[IBViewController2 alloc] initWithNibName:@"IBViewController2" bundle:nil];
    [[self navigationController]pushViewController:vc2 animated:YES];
}

- (IBAction)pr1:(id)sender {
    PRViewController1 *vc3 = [[PRViewController1 alloc] init];
    [[self navigationController]pushViewController:vc3 animated:YES];
}

- (IBAction)pr2:(id)sender {
    PRViewController2 *vc4 = [[PRViewController2 alloc] init];
    [[self navigationController]pushViewController:vc4 animated:YES];
}

- (IBAction)vf1:(id)sender {
    VFLViewController1 *vc5 = [[VFLViewController1 alloc] init];
    [[self navigationController]pushViewController:vc5 animated:YES];
}

- (IBAction)vf2:(id)sender {
    VFLViewController2 *vc6 = [[VFLViewController2 alloc] init];
    [[self navigationController]pushViewController:vc6 animated:YES];
}

- (IBAction)vf3:(id)sender {
    VFLViewController3 *vc7 = [[VFLViewController3 alloc] init];
    [[self navigationController]pushViewController:vc7 animated:YES];
}

- (IBAction)vf4:(id)sender {
    VFLMetricsViewController *vc8 = [[VFLMetricsViewController alloc] init];
    [[self navigationController]pushViewController:vc8 animated:YES];
}

- (IBAction)db1:(id)sender {
    DbViewController1 *vc9 = [[DbViewController1 alloc] init];
    [[self navigationController]pushViewController:vc9 animated:YES];
}

- (IBAction)in1:(id)sender {
    InstrumentsViewController *vc10 = [[InstrumentsViewController alloc] init];
    [[self navigationController]pushViewController:vc10 animated:YES];
}

- (IBAction)hc1:(id)sender {
    HugcompViewController *hc1 = [[HugcompViewController alloc] initWithNibName:@"HugcompViewController" bundle:nil];
    [[self navigationController]pushViewController:hc1 animated:YES];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



@end
