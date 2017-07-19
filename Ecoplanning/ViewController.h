//
//  ViewController.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 05/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface ViewController : NSViewController<NSTabViewDelegate>{
    __weak IBOutlet NSTextFieldCell *cellView;
    IBOutlet NSButtonCell *check;
    IBOutlet NSTableView *tableView;
    IBOutlet NSButtonCell *checkButton;
    NSMutableDictionary *dict;
    NSMutableDictionary *checkState;
    int number;   //nombre de tâches
    NSString *cell;
}
//@property (weak) IBOutlet Ordonnancement *tableView;
@property (assign) IBOutlet NSArrayController *arrayController;
- (IBAction)foot:(id)sender;
@end

