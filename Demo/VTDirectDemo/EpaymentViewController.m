//
//  EpaymentViewController.m
//  VTDirectDemo
//
//  Created by Arie on 9/5/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "EpaymentViewController.h"
#import <MidtransCoreKit/MidtransCoreKit.h>
#import <MidtransCoreKit/MidtransPaymentListModel.h>
@interface EpaymentViewController () <MidtransPaymentWebControllerDelegate>

@end
@implementation NSNumber (formatter)

- (NSString *)formattedCurrencyNumber {
    NSNumberFormatter *nf = [NSNumberFormatter indonesianCurrencyFormatter];
    return [@"Rp " stringByAppendingString:[nf stringFromNumber:self]];
}

@end

@implementation EpaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  self.paymentMethod.localPaymentIdentifier;
    self.transactionID.text = self.transactionToken.transactionDetails.orderId;
    self.transactionAmount.text = self.transactionToken.transactionDetails.grossAmount.formattedCurrencyNumber;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)payNowButtonDidTapped:(id)sender {
    
    id<MidtransPaymentDetails>paymentDetails;
    
    if ([self.paymentMethod.internalBaseClassIdentifier isEqualToString:MIDTRANS_PAYMENT_BCA_KLIKPAY]) {
        paymentDetails = [[MidtransPaymentBCAKlikpay alloc] init];
    }
    else if ([self.paymentMethod.internalBaseClassIdentifier isEqualToString:MIDTRANS_PAYMENT_MANDIRI_ECASH]) {
        paymentDetails = [[MidtransPaymentMandiriECash alloc] init];
    }
    else if ([self.paymentMethod.internalBaseClassIdentifier isEqualToString:MIDTRANS_PAYMENT_BRI_EPAY]) {
        paymentDetails = [[MidtransPaymentEpayBRI alloc] init];
    }
    else if ([self.paymentMethod.internalBaseClassIdentifier isEqualToString:MIDTRANS_PAYMENT_CIMB_CLICKS]) {
        paymentDetails = [[MidtransPaymentCIMBClicks alloc] init];
    }
    else if ([self.paymentMethod.internalBaseClassIdentifier isEqualToString:MIDTRANS_PAYMENT_XL_TUNAI]) {
        paymentDetails = [[MidtransPaymentXLTunai alloc] init];
    }
    
    MidtransTransaction *transaction = [[MidtransTransaction alloc] initWithPaymentDetails:paymentDetails token:self.transactionToken];
    
    [[MidtransMerchantClient sharedClient] performTransaction:transaction completion:^(MidtransTransactionResult *result, NSError *error) {
        
        if (error) {
            
        }
        else {
            if (result.redirectURL) {
                MidtransPaymentWebController *vc = [[MidtransPaymentWebController alloc] initWithTransactionResult:result
                                                                                                 paymentIdentifier:self.paymentMethod.internalBaseClassIdentifier];
                vc.delegate = self;
                [self.navigationController pushViewController:vc animated:YES];
            }
            else {
                
            }
        }
    }];
    
}

/**
 *  if there is payment opening the webview please using this as handler
 *
 *  @param webPaymentController webPaymentController description
 *  @param error                error description
 */
- (void)webPaymentController:(MidtransPaymentWebController *)webPaymentController transactionError:(NSError *)error {
}
@end
