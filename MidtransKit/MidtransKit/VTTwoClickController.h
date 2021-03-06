//
//  VTTwoClickController.h
//  MidtransKit
//
//  Created by Nanang Rafsanjani on 3/4/16.
//  Copyright © 2016 Veritrans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MidtransCoreKit/MidtransCoreKit.h>

#import "MidtransUIPaymentController.h"
#import "VTCCBackView.h"

@interface VTTwoClickController : MidtransUIPaymentController
@property (weak, nonatomic) IBOutlet VTCCBackView *backView;

- (instancetype)initWithToken:(MidtransTransactionTokenResponse *)token
                   maskedCard:(MidtransMaskedCreditCard *)maskedCard;

@end
