//
//  TableViewCell.m
//  ObjcPayloadApp
//
//  Created by FUJITSU CLOUD TECHNOLOGIES on 2016/10/25.
//  Copyright 2020 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *payloadKey;

@end

/**
 TableViewのCellです
 */
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/**
 セルにkeyとvalueをセットして表示します
 */
- (void)setCellWithKey:(NSString *)keyStr value:(id)value {
    self.payloadKey.text = keyStr;
    if ([value isKindOfClass:[NSDictionary class]]) {
        // dictionaryの場合は、文字列に変換する
        NSError*error=nil;
        NSData*data=[NSJSONSerialization dataWithJSONObject:value options:2 error:&error];
        self.valueTextField.text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    } else {
        self.valueTextField.text = value;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
