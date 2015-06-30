//
//  LoginViewController.h
//  Gift Wizard
//
//  Created by Balbina Santana on 6/29/15.
//  Copyright (c) 2015 Balbina Santana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
- (IBAction)clickLogIntoFB:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btFBLogin;

@end
