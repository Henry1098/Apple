//
//  NouveauProjet.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 19/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "NouveauProjet.h"

@interface NouveauProjet ()

@end

@implementation NouveauProjet- (void)windowDidLoad {
    [super windowDidLoad];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (IBAction)dateSelection:(id)sender {
strDate =[calendrier dateValue];
    dateD.stringValue = strDate;
}
@end
