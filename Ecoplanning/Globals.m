//
//  Globals.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Globals.h"

@implementation Globals


@synthesize datedebutProjet,dateAvancement;
@synthesize codeProjet, titreProjet, Observations;

-(void)changementDateDebut:(NSDate*) datedeb
{
    datedebutProjet = datedeb;
}
@end
