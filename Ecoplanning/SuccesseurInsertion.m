//
//  SuccesseurInsertion.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 19/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "SuccesseurInsertion.h"
#import "Globals.h"

@interface SuccesseurInsertion ()

@end

@implementation SuccesseurInsertion

- (void)windowDidLoad {
    [super windowDidLoad];
    [label setStringValue:[NSString stringWithFormat:@"%d",tacheselectionne+1]];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)SucccesseurOk:(NSButton *)sender {
    NSLog(@"Hello Insertion Successeur");
    [self close];
}
@end
