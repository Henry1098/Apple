//
//  Tache.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 10/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tache.h"
#import "Globals.h"


@implementation Tache

Tache *tache;
Globals *globals;

-(void) initialization{
        numero = 1;
        designation =@"Tache 1";
        duree = 1;
        datedeb = globals.datedebutProjet;
        datefin = [globals calcdate:globals.datedebutProjet :1];
        datedeb2 = globals.datedebutProjet;;
        datefin2 = [globals calcdate:globals.datedebutProjet :1];
        marge = 1;
        cal = 1;
  

}

@synthesize numero,duree, marge, cout, coutR;
@synthesize designation,codeTache, phase,intervenant, tri, champsLibre;
@synthesize datedeb, datefin, datedeb2, datefin2, debcont, fincont;
@synthesize numeropred,designationpred, dureepred,PosDebPr,Lien, Decal, Mgt, numerosucc, designationsucc, dureesucc, DebTot, LienSucc, DecalSucc,MgtSucc, DebTache;

@end
