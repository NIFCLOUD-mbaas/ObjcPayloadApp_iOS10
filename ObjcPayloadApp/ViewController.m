//
//  ViewController.m
//  ObjcPayloadApp
//
//  Created by FUJITSU CLOUD TECHNOLOGIES on 2016/10/25.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
// AppDelegate
@property (nonatomic)AppDelegate *appDelegate;
// textFieldの位置情報
@property (nonatomic) CGFloat textFieldPosition;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // AppDelegate
    self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    // TableView
    self.payloadTableView.delegate = self;
    self.payloadTableView.dataSource = self;
    
    // キーボードのイベント設定
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
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
    cell.valueTextField.delegate = self;
    cell.valueTextField.tag = indexPath.row;
    
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

/**
 キーボードを閉じます。
 */
- (IBAction)tapScreen:(id)sender {
    // キーボードを閉じる
    [self.view endEditing:YES];
}

#pragma -mark TextFieldDelegate

// キーボードの「Return」押下時の処理
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // キーボードを閉じる
    [textField resignFirstResponder];
    
    return YES;
}

/**
 textFieldの編集を開始したら呼ばれます
 textFieldの位置情報をセットします
 */
-(BOOL)textFieldShouldBeginEditing:(UITextField*)textField {
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:textField.tag inSection:0];
    
    CGRect rectOfCellInTableView = [self.payloadTableView rectForRowAtIndexPath:indexpath];
    CGRect rectOfCellInSuperview = [self.payloadTableView convertRect:rectOfCellInTableView toView:[self.payloadTableView superview]];
    // textFieldの位置情報をセット
    self.textFieldPosition = rectOfCellInSuperview.origin.y;
    
    return YES;
}

#pragma -mark keyboardWillShow

/**
 キーボードが表示されたら呼ばれる
 */
- (void)keyboardWillShow:(NSNotification*)notification {
    
    CGRect keyboardRect = [[notification userInfo][UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [[self.view superview] convertRect:keyboardRect fromView:nil];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    CGFloat keyboardPosition = self.view.frame.size.height - keyboardRect.size.height;
    
    // 編集するtextFieldの位置がキーボードより下にある場合は、位置を移動する
    if (self.textFieldPosition + self.payloadTableView.rowHeight > keyboardPosition) {
        //アニメーションでtextFieldを動かす
        [UIView animateWithDuration:[duration doubleValue]
                         animations:^{
                             CGRect rect = self.payloadTableView.frame;
                             rect.origin.y = keyboardRect.origin.y - self.textFieldPosition - self.payloadTableView.rowHeight / 2.0f;
                             self.payloadTableView.frame = rect;
                         } ];
    }
}

/**
 キーボードが隠れると呼ばれる
 */
- (void)keyboardWillHide:(NSNotification *)notification {
    
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    //アニメーションでtextFieldを動かす
    [UIView animateWithDuration:[duration doubleValue]
                     animations:^{
                         CGRect rect = self.payloadTableView.frame;
                         rect.origin.y = 98.0f; // tableViewの元の位置
                         self.payloadTableView.frame = rect;
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
