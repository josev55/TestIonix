//
//  IOXUserViewController.h
//  TestIonix
//
//  Created by Jose Vildosola on 29-12-16.
//  Copyright © 2016 Vaingore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IOXUserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (nonatomic, strong) NSDictionary *data;
@end
