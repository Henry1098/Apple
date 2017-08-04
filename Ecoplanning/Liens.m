//
//  Liens.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 19/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Liens.h"
#import "ViewController.h"
#import "Globals.h"
@interface Liens ()

@end

@implementation Liens

ViewController *view;
int gcounterliaison;
- (void)windowDidLoad {
    [super windowDidLoad];
    view = [[ViewController alloc]init];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)executerLiens:(NSButton *)sender {
if([FD state] == NSOnState)
{
    lientache.FD = YES;
    lientache.DD = NO;
    lientache.FF = NO;
}
if([DD state] == NSOnState)
{
    lientache.FD = NO;
    lientache.DD = YES;
    lientache.FF = NO;

}
if([FF state] == NSOnState)
{
        lientache.FD = NO;
        lientache.DD = NO;
        lientache.FF = YES;

}
    gcounterliaison= 1;
        [view executerLiens];
    [self close];
}

- (IBAction)annuler:(NSButton *)sender {
    [self close];
}
@end
