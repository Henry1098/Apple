//
//  AppDelegate.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 05/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ViewController.h"
@class NouveauProjet;
@class Liens;

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
NouveauProjet *projet;
Liens *lier;
     ViewController *view;
}

@end

