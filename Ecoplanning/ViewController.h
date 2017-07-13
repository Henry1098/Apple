//
//  ViewController.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 05/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController{
    
    IBOutlet NSButtonCell *check;
    IBOutlet NSTableView *tableView;
    
}
//@property (weak) IBOutlet Ordonnancement *tableView;
@property (assign) IBOutlet NSArrayController *arrayController;


@end

