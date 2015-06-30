//
//  AppDelegate.m
//  Gift Wizard
//
//  Created by Balbina Santana on 6/29/15.
//  Copyright (c) 2015 Balbina Santana. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "LoginViewController.h"
#import "ViewController.h"
#import "SettingsViewController.h"
#import "EditProfileViewController.h"
#import "MainViewController.h"
#import "ProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window makeKeyAndVisible];
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    if ([FBSDKAccessToken currentAccessToken])
    {
        [self openFBSession];
    }
    else
    {
        [self performSelector:@selector(showLoginView) withObject:nil afterDelay:0.0];
    }
    return YES;
    

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}


#pragma mark - Login view

- (void)showLoginView
{
    //when you first open the app and log in with fb
    if ([[self.window.rootViewController presentedViewController] isKindOfClass:[LoginViewController class]]){
        NSLog(@"entre1");
        
        [[self.window.rootViewController presentedViewController] dismissViewControllerAnimated:NO completion:nil];
    }
    //when it's already logged in when you enter the app and logout
    else if ([self.window.rootViewController presentedViewController]) {
        NSLog(@"entre2");
        [self.window.rootViewController dismissViewControllerAnimated:NO completion:^{
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LoginViewController *loginView =[storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
            
            [self.window.rootViewController presentViewController: loginView animated:NO completion:nil];
        }];
    }
    //first time login with fb
    else {
        NSLog(@"entre3");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginView =[storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
        
        [self.window.rootViewController presentViewController: loginView animated:NO completion:nil];
    }
}

#pragma mark - Facebook login

- (void)openFBSession
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *mainView =[storyboard instantiateViewControllerWithIdentifier:@"MainView"];
            
            if ([self.window.rootViewController presentedViewController]) {
                [[self.window.rootViewController presentedViewController] presentViewController:mainView animated:NO completion:nil];
            }
            else {
                [self.window.rootViewController presentViewController:mainView animated:NO completion:nil];
            }
            
            /*
             // If you ask for multiple permissions at once, you
             // should check if specific permissions missing
             if ([result.grantedPermissions containsObject:@"email"]) {
             // Do work
             }
             */
        }
    }];
}


@end
