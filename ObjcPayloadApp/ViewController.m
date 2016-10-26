//
//  ViewController.m
//  ObjcPayloadApp
//
//  Created by Nifty on 2016/10/25.
//  Copyright © 2016年 Nifty. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic)AppDelegate *appDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // PayloadManager
    self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    // TableView
    self.payloadTableView.delegate = self;
    self.payloadTableView.dataSource = self;
}

#pragma -mark TableViewDataSource

/**
 TableViewのCellの数を設定します。
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.appDelegate.payloadDic count];
}

/**
 TableViewのCellを返します。
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"payloadCell" forIndexPath:indexPath];
    
    NSString *keyStr = [self.appDelegate.payloadDic allKeys][indexPath.row];
    NSString *valueStr = [self.appDelegate.payloadDic objectForKey:keyStr];
    // テーブルにCellデータを設定
    [cell setCellWithKey:keyStr value:valueStr];
    
    return cell;
}

/**
 画面クリアします。
 */
- (IBAction)clearScreen:(id)sender {
    // 値をクリア
    self.appDelegate.payloadDic = [[NSDictionary alloc]init];
    // テーブル更新
    [self.payloadTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
