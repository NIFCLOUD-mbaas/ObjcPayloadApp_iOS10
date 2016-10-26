//
//  PayloadManager.m
//  ObjcPayloadApp
//
//  Created by Nifty on 2016/10/25.
//  Copyright © 2016年 Nifty. All rights reserved.
//

#import "PayloadManager.h"

/**
 Payloadで取得したdictionaryを管理するクラス
 シングルトンで共通に管理します
 */
@implementation PayloadManager

static PayloadManager *sharedInstance = nil;

+ (PayloadManager *)sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[PayloadManager alloc]init];
    }
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        //Initialization
        self.payloadDic = [[NSDictionary alloc]init];
    }
    return self;
}

@end
