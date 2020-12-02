//
//  AppDelegate.h
//  ObjcPayloadApp
//
//  Created by FUJITSU CLOUD TECHNOLOGIES on 2016/10/25.
//  Copyright 2020 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
// ペイロードを管理するdictionary
@property (nonatomic)NSDictionary *payloadDic;

@end

