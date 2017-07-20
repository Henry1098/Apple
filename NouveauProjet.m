//
//  NouveauProjet.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 19/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "NouveauProjet.h"
#import "Globals.h"


@interface NouveauProjet ()

@end

@implementation NouveauProjet

- (void)windowDidLoad {
    [super windowDidLoad];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (IBAction)dateSelection:(id)sender {
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd/MM/yy"];
  strDate =  [format stringFromDate:[calendrier dateValue]];

    dateD.stringValue = strDate;
}
- (IBAction)sauver:(id)sender {

    datedebutProjet = dateD.stringValue;
    [self close];
}
@end
