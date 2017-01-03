//
//  IOXLoginViewController.m
//  TestIonix
//
//  Created by Jose Vildosola on 29-12-16.
//  Copyright © 2016 Vaingore. All rights reserved.
//

#import "IOXLoginViewController.h"
#import "IOXCryptoWrapper.h"
#import "IOXUsersViewController.h"

@interface IOXLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *rutTextField;
@property(nonatomic, strong) NSArray *users;

@end

@implementation IOXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rutTextField.layer.cornerRadius = 5;
    
    self.rutTextField.layer.borderWidth = 4;
    
    self.rutTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    
    self.rutTextField.leftView = paddingView;
    
    self.rutTextField.leftViewMode = UITextFieldViewModeAlways;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)performLogin:(id)sender {
    
    NSString *cryptoRut = [[IOXCryptoWrapper sharedCryptoWrapper] DESEncrypt:self.rutTextField.text withKey:@"ionix123456"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.170:8089/test/search?rut=%@",cryptoRut]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        NSError *err;
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
            
            self.users = dict[@"result"][@"items"];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            });
        
    }];
    
    [task resume];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    IOXUsersViewController *vc = [segue destinationViewController];
    
    vc.dataSource = self.users;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    for (UIView *view in self.view.subviews) {
        if (view.isFirstResponder) {
            [view resignFirstResponder];
        }
    }
    
}


@end
