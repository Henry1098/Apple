//
//  Successeur.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 28/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Successeur.h"

@implementation Successeur


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
}
@end
