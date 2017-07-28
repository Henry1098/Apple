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
    numero = [NSMutableArray array];
    snumero = [NSMutableArray array];
    sdesignation = [NSMutableArray array];
    sduree = [NSMutableArray array];
    sDebTot = [NSMutableArray array];
    sLien = [NSMutableArray array];
    sDecal = [NSMutableArray array];
    sMgT = [NSMutableArray array];
    DebavTache =[NSMutableArray array];
    nombreSuccesseur = 0;
}


-(void)ajouterSuccesseur:(NSString *)numero_ :(NSString *)snumero_ :(NSString *)sdesignation_ :(NSString *)sduree_ :(NSString *)psDebTot_ :(NSString *)sLien_ :(NSString *)sDecal_ :(NSString *)sMgT_ :(NSString *)DebavTache_
{
    
    [numero addObject:numero_];
    [snumero addObject:snumero_];
    [sdesignation addObject:sdesignation_];
    [sduree addObject:sduree_];
    [sDebTot addObject:psDebTot_];
    [sLien addObject:sLien_];
    [sDecal addObject:sDecal_];
    [sMgT addObject:sMgT_];
    [DebavTache addObject:DebavTache_];
    nombreSuccesseur++;
}


-(void)afficherSuccesseur{
    
    for (int i = 0; i<nombreSuccesseur;i++)
    {
        NSLog(@"Tache %@ Successeur numero %@ avec la designation %@ et de la duree %@ et DebTot %@ et lien %@ . Avec le décalage %@ , une marge de %@ et DebAvTache de %@",numero[i],snumero[i],sdesignation[i],sduree[i],sDebTot[i], sLien[i],sDecal[i],sMgT[i], DebavTache[i]);
    }
}


@end
