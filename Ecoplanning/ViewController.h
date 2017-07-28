//
//  ViewController.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 05/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface ViewController : NSViewController<NSTabViewDelegate>{
    IBOutlet NSButtonCell *check;
    IBOutlet NSTableView *tableView;
    IBOutlet NSButtonCell *checkButton;
    NSMutableDictionary *dict;
    NSMutableArray *checkState;
    int number;   //nombre de tâches
    NSString *cell;
    NSDate *datum;
    __weak IBOutlet NSTextFieldCell *dureeprev;
    NSDateFormatter *form;
    
    NSDateComponents * comp;
    NSCalendar *cal;
}
- (IBAction)bre:(id)sender;

- (IBAction)checkded:(NSButton *)sender;

- (void)calculduree2:(int)number:(int)Row;
//@property (weak) IBOutlet Ordonnancement *tableView;
@property (assign) IBOutlet NSArrayController *arrayController;
- (IBAction)foot:(id)sender;
-(void) executerLiens;
- (void)calculduree;
@end

