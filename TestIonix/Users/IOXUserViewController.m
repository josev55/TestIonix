//
//  IOXUserViewController.m
//  TestIonix
//
//  Created by Jose Vildosola on 29-12-16.
//  Copyright © 2016 Vaingore. All rights reserved.
//

#import "IOXUserViewController.h"

@interface IOXUserViewController ()

@end

@implementation IOXUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.email.text = [NSString stringWithFormat:@"Email: %@",self.data[@"detail"][@"email"]];
    
    self.phoneNumber.text = [NSString stringWithFormat:@"Phone number: %@",self.data[@"detail"][@"phone_number"]];
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

@end
