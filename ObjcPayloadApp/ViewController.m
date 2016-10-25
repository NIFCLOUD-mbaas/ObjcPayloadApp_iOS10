//
//  ViewController.m
//  ObjcPayloadApp
//
//  Created by oono on 2016/10/25.
//  Copyright © 2016年 Nifty. All rights reserved.
//

#import "ViewController.h"
#import "PayloadManager.h"

#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic)PayloadManager *payloadManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // PayloadManager
    self.payloadManager = [PayloadManager sharedInstance];
    // TableView
    self.payloadTableView.delegate = self;
    self.payloadTableView.dataSource = self;
}

#pragma -mark TableViewDataSource

/**
 TableViewのCellの数を設定します。
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.payloadManager.payloadDic count];
}

/**
 TableViewのCellを返します。
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"payloadCell" forIndexPath:indexPath];
    
    NSString *keyStr = [self.payloadManager.payloadDic allKeys][indexPath.row];
    NSString *valueStr = [self.payloadManager.payloadDic objectForKey:keyStr];
    // テーブルにCellデータを設定
    [cell setCellWithKey:keyStr value:valueStr];
    
    return cell;
}

/**
 画面クリアします。
 */
- (IBAction)clearScreen:(id)sender {
    // 値をクリア
    self.payloadManager.payloadDic = [[NSDictionary alloc]init];
    // テーブル更新
    [self.payloadTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
