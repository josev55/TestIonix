//
//  IOXUsersViewController.m
//  TestIonix
//
//  Created by Jose Vildosola on 29-12-16.
//  Copyright © 2016 Vaingore. All rights reserved.
//

#import "IOXUsersViewController.h"
#import "IOXUserViewController.h"

@interface IOXUsersViewController ()
@property (weak, nonatomic) IBOutlet UITableView *usersTableView;
@property (nonatomic, strong) NSDictionary *selectedUser;

@end

@implementation IOXUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.usersTableView.delegate = self;
    
    self.usersTableView.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ident"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ident"];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row][@"name"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    self.selectedUser = self.dataSource[indexPath.row];
    
    [self performSegueWithIdentifier:@"userSegue" sender:nil];
    
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    IOXUserViewController *vc = [segue destinationViewController];
    
    vc.data = self.selectedUser;
}


@end
