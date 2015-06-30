//
//  ProfileViewController.h
//  Gift Wizard
//
//  Created by Balbina Santana on 6/29/15.
//  Copyright (c) 2015 Balbina Santana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet FBSDKProfilePictureView *profilePicture;

@end
