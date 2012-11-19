//
//  AppDelegate.m
//  IBAutoLayout
//
//  Created by Matt Tancock on 26/09/2012.
//  Copyright (c) 2012 iDeveloper.tv. All rights reserved.

//

#import "AppDelegate.h"

#import "MenuViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    
    MenuViewController *mc  = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    
    UINavigationController *navcontroller = [[UINavigationController alloc]initWithRootViewController:mc];
    self.window.rootViewController = navcontroller;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
