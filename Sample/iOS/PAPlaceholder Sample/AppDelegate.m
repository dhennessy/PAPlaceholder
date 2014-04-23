//
//  AppDelegate.m
//  PAPlaceholder Sample
//
//  Created by Denis Hennessy on 02/01/2014.
//  Copyright (c) 2014 Denis Hennessy. All rights reserved.
//

#import "AppDelegate.h"
#import "PAPlaceholderView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    splitViewController.delegate = (id)navigationController.topViewController;
    
    PAPlaceholderView *view = (PAPlaceholderView *)navigationController.topViewController.view;
    view.dimensionInset = 0.9;
    
    return YES;
}
							
@end
