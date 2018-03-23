//
//  AppDelegate.m
//  NYTimes
//
//  Created by Kranthi Tatikonda on 22/03/18.
//  Copyright © 2018 Kranthi Tatikonda. All rights reserved.
//

#import "AppDelegate.h"
#import "FeaturedArticlesTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    FeaturedArticlesTableViewController *featuredController = [FeaturedArticlesTableViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:featuredController];
    self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];

    return YES;
}

@end
