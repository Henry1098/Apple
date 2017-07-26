//
//  Liens.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 19/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Liens.h"
#import "ViewController.h"

@interface Liens ()

@end

@implementation Liens

ViewController *view;
- (void)windowDidLoad {
    [super windowDidLoad];
    view = [[ViewController alloc]init];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)executerLiens:(NSButton *)sender {

    [self close];
    
        [view executerLiens];
}

- (IBAction)annuler:(NSButton *)sender {
    [self close];
}
@end
