//
//  NouveauProjet.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NouveauProjet : NSWindowController
{
    __weak IBOutlet NSDatePicker *calendrier;
    
    __weak IBOutlet NSTextField *dateD;
    
    NSString *strDate;

}
@end
