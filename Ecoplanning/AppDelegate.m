//
//  AppDelegate.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 05/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "AppDelegate.h"
#import "NouveauProjet.h"
#import "Liens.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)startNewProject:(id)sender {
   
}


-(IBAction)NouveauProj:(id)sender{
    if(!projet)
    {
        projet = [[NouveauProjet alloc]initWithWindowNibName:@"NouveauProjet"];
    }
    [projet showWindow:self];
}

-(IBAction)Lier:(id)sender{
    if(!lier)
    {
        lier = [[Liens alloc]initWithWindowNibName:@"Lien"];
    }
    [lier showWindow:self];
}


@end
