//
//  PredecesseurInsertion.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 19/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "PredecesseurInsertion.h"
#import "Globals.h"

@interface PredecesseurInsertion ()

@end

@implementation PredecesseurInsertion

- (void)windowDidLoad {
    [super windowDidLoad];
     [label2 setStringValue:[NSString stringWithFormat:@"%d",tacheselectionne+1]];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)Okbutton:(NSButton *)sender {
    NSLog(@"Hello Insertion");
    [self close];
}
@end
