//
//  MasterViewController.m
//  IBAutoLayout
//
//  Created by Sladan Trajkovic on 2012-11-19.
//  Copyright (c) 2012 tanctop. All rights reserved.
//

#import "MasterViewController.h"

#import "IBViewController1.h"
#import "IBViewController2.h"
#import "PRViewController1.h"
#import "PRViewController2.h"
#import "VFLViewController1.h"
#import "VFLViewController2.h"
#import "VFLViewController3.h"
#import "ExtraViewController.h"

@interface MasterViewController () {
    NSArray *_sectionHeaders;
    NSArray *_sections;
}
@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _sectionHeaders = @[@"Interface Builder", @"Programmatically", @"Visual Format Lang", @"Extra"];
        
        NSArray *section1 = @[@"Assignment 1", @"Assignment 2"];
        NSArray *section2 = @[@"Assignment 3"];
        NSArray *section3 = @[@"Assignment 4", @"Assignment 5"];
        NSArray *section4 = @[@"Assignment 6"];
        _sections = @[section1, section2, section3, section4];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return _sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sectionHeaders[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *currentSection = (NSArray *)_sections[section];
    
    return currentSection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
    NSArray *currentSection = _sections[indexPath.section];
    cell.textLabel.text = currentSection[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    UIViewController* viewController;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            viewController = [[IBViewController1 alloc] initWithNibName:@"IBViewController1" bundle:nil];
        } else if (indexPath.row == 1) {
            viewController = [[IBViewController2 alloc] initWithNibName:@"IBViewController2" bundle:nil];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            viewController = [[PRViewController1 alloc] init];
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            viewController = [[VFLViewController1 alloc] init];
        } else if (indexPath.row == 1) {
            viewController = [[VFLViewController2 alloc] init];
        } else if (indexPath.row == 2) {
            viewController = [[VFLViewController3 alloc] init];
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            viewController = [[ExtraViewController alloc] initWithNibName:@"ExtraViewController" bundle:nil];
        }
    }
    
    [[self navigationController]pushViewController:viewController animated:YES];
}

@end
