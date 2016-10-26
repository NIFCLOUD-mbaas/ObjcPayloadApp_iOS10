//
//  TableViewCell.h
//  ObjcPayloadApp
//
//  Created by Nifty on 2016/10/25.
//  Copyright © 2016年 Nifty. All rights reserved.
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
