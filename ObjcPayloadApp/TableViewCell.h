//
//  TableViewCell.h
//  ObjcPayloadApp
//
//  Created by FUJITSU CLOUD TECHNOLOGIES on 2016/10/25.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

#import <UIKit/UIKit.h>

/**
 TableViewのCellです
 */
@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *valueTextField;

/**
 セルにkeyとvalueをセットして表示します
 */
- (void)setCellWithKey:(NSString *)keyStr value:(id)value;

@end
