//
//  BankTransferViewController.m
//  VTDirectDemo
//
//  Created by Arie on 9/5/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "BankTransferViewController.h"
#import "SamplePaymentListTableViewCell.h"
#import <MidtransCoreKit/MidtransCoreKit.h>
#import <MidtransCoreKit/MidtransPaymentListModel.h>
@interface BankTransferViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation BankTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bankList.banks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MidtransPaymentListModel *paymentMethod = self.bankList.banks[indexPath.row];
    SamplePaymentListTableViewCell *cell = (SamplePaymentListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SamplePaymentListTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SamplePaymentListTableViewCell" owner:self options:nil] firstObject];
        [tableView registerNib:[UINib nibWithNibName:@"SamplePaymentListTableViewCell" bundle:nil] forCellReuseIdentifier:@"SamplePaymentListTableViewCell"];
    }
    [cell configurePaymetnList:paymentMethod];
    return cell;
}

@end
