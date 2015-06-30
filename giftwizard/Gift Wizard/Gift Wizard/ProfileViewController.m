//
//  ProfileViewController.m
//  Gift Wizard
//
//  Created by Balbina Santana on 6/29/15.
//  Copyright (c) 2015 Balbina Santana. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.profilePicture.layer.cornerRadius = 30.0;
    self.profilePicture.clipsToBounds=YES;
    self.profilePicture.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.profilePicture.layer.borderWidth = 1.0;
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

@end
