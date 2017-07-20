//
//  NouveauProjet.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 19/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NouveauProjet : NSWindowController
{
    __weak IBOutlet NSTextField *dateD;
    
    __weak IBOutlet NSDatePicker *calendrier;
    NSString *strDate;
}
- (IBAction)sauver:(id)sender;
@end
