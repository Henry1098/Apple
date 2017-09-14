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
    __weak IBOutlet NSTableView *SuccTable;
    NSDateFormatter *form;
    
    IBOutlet NSArrayController *SuccArray;
    IBOutlet NSArrayController *predArray;
    NSDateComponents * comp;
    NSCalendar *cal;
    NSMutableArray *touteslestaches;
    NSMutableArray *touteslespred;
    NSMutableArray *touteslessucc;
    NSMutableArray *toutlesdurees;
    __weak IBOutlet NSView *gantt;
    __weak IBOutlet NSTableView *predTable;
    NSMutableArray *datesarrange;
}

- (IBAction)bre:(id)sender;

- (IBAction)checkded:(id)sender;

- (void)calculduree2:(int)number:(int)Row;
//@property (weak) IBOutlet Ordonnancement *tableView;
@property (assign) IBOutlet NSArrayController *arrayController;
- (IBAction)foot:(id)sender;
-(void) executerLiens;
-(void)calculduree;
-(void)lierVersionUnPred;
-(void)lierVersionUnSucc;
-(void)donneesgantt:(NSString *)designation:(int) decalage:(NSString *)lien;
-(void)dessinergantt1:(int)row;
-(void)dessinergantt2:(NSString *)designation:(int)decalage:(NSString *)lien;
-(void)calculMarge;
@end

