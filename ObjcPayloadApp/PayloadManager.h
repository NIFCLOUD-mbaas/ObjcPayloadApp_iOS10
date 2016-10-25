//
//  PayloadManager.h
//  ObjcPayloadApp
//
//  Created by oono on 2016/10/25.
//  Copyright © 2016年 Nifty. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Payloadで取得したdictionaryを管理するクラス
 シングルトンで共通に管理します
 */
@interface PayloadManager : NSObject

// payloadを保管するdictionary
@property (nonatomic)NSDictionary *payloadDic;

+ (PayloadManager *)sharedInstance;

@end
