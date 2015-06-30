//
//  SettingsViewController.m
//  Gift Wizard
//
//  Created by Balbina Santana on 6/29/15.
//  Copyright (c) 2015 Balbina Santana. All rights reserved.
//

#import "SettingsViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)LogOutFB {
    FBSDKLoginManager *logout = [[FBSDKLoginManager alloc] init];
    [logout logOut];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate showLoginView];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1)
    {
        [self LogOutFB];
    }
}

@end
