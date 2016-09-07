//
//  VTPaymentBCAKlikpay.m
//  MidtransCoreKit
//
//  Created by Nanang Rafsanjani on 6/13/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import "MTPaymentBCAKlikpay.h"
#import "MTHelper.h"
#import "MTConstant.h"

@interface MTPaymentBCAKlikpay()
@property (nonatomic) MTTransactionTokenResponse *token;
@end

@implementation MTPaymentBCAKlikpay

- (instancetype _Nonnull) initWithToken:(MTTransactionTokenResponse *_Nonnull)token {
    if (self = [super init]) {
        self.token = token;
    }
    return self;
}

- (NSString *)paymentType {
    return MT_PAYMENT_BCA_KLIKPAY;
}

- (NSDictionary *)dictionaryValue {
    return @{@"transaction_id":self.token.tokenId};
}

- (NSString *)chargeURL {
    return ENDPOINT_CHARGE_BCA_KLIKPAY;
}

- (MTTransactionTokenResponse *)snapToken {
    return self.token;
}
@end