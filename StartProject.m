//
//  StartProject.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "StartProject.h"

@interface StartProject ()

@end

@implementation StartProject

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)onDataClick:(id)sender {
    NSDatePicker *picker = [[NSDatePicker alloc]init];
    NSDate * date = picker.dateValue;
    NSTextField *txt = [[NSTextField alloc]init];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd/mm/yy"];
    NSString *strDate = [format stringFromDate:date];
    
    
    
    txt.stringValue = strDate;
    
}

@end
