//
//  Successeur.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 28/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Successeur.h"

@implementation Successeur

@synthesize nombreSuccesseur;

-(void)initialize
{
    successeur = [NSMutableDictionary dictionary];
    nombreSuccesseur = 0;
}


-(void)ajouterSuccesseur:(NSString *)numero_ :(NSString *)snumero_ :(NSString *)sdesignation_ :(NSString *)sduree_ :(NSString *)psDebTot_ :(NSString *)sLien_ :(NSString *)sDecal_ :(NSString *)sMgT_ :(NSString *)DebavTache_
{
    successeur = [NSMutableDictionary dictionaryWithObjectsAndKeys:numero_, @"numero",snumero_,@"snumero",sdesignation_, @"sdesignation", sduree_, @"sduree",psDebTot_,@"sDebTot",sLien_, @"sLien",sDecal_, @"sDecal",DebavTache_, @"DebavTache", nil];
    NSString *str = [successeur objectForKey:@"numero"];
    NSLog(@"Successeur : %@",str);
    
    nombreSuccesseur++;
}


-(void)afficherSuccesseur{
    NSLog(@"%@",successeur);
}


@end
