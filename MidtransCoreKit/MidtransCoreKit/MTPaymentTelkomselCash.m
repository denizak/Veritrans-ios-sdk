//
//  VTPaymentTelkomselCash.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 8/8/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "MTPaymentTelkomselCash.h"

@interface MTPaymentTelkomselCash()
@property (nonatomic) NSString *msisdn;
@property (nonatomic) MTTransactionTokenResponse *token;
@end

@implementation MTPaymentTelkomselCash

- (instancetype _Nonnull)initWithMSISDN:(NSString *_Nonnull)msisdn token:(MTTransactionTokenResponse *_Nonnull)token {
    if (self = [super init]) {
        self.msisdn = msisdn;
        self.token = token;
    }
    return self;
}

- (NSString *)paymentType {
    return MT_PAYMENT_TELKOMSEL_CASH;
}
- (NSDictionary *)dictionaryValue {
    return @{@"customer" : self.msisdn,
             @"transaction_id" : self.token.tokenId};
}
- (NSString *)chargeURL {
    return ENDPOINT_CHARGE_TELKOMSEL_CASH;
}
- (MTTransactionTokenResponse *)snapToken {
    return self.token;
}

@end