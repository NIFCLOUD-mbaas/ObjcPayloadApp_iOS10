//
//  AppDelegate.h
//  ObjcPayloadApp
//
//  Created by Nifty on 2016/10/25.
//  Copyright © 2016年 Nifty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
// ペイロードを管理するdictionary
@property (nonatomic)NSDictionary *payloadDic;

@end

