//
//  Liens.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 19/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Liens : NSWindowController{
    
    __weak IBOutlet NSButton *FF;
    __weak IBOutlet NSButton *FD;
    __weak IBOutlet NSButton *DD;
}
- (IBAction)executerLiens:(NSButton *)sender;
- (IBAction)annuler:(NSButton *)sender;


@end
