//
//  Predecesseur.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 28/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Predecesseur.h"

@implementation Predecesseur
@synthesize numero,pnumero,pdesignation, pduree, pPosDebPr, pLien, pDecal,pMgT;
@synthesize nombrePredecesseur;

-(void)initialize
{
    numero = [NSMutableArray array];
    pnumero = [NSMutableArray array];
    pdesignation = [NSMutableArray array];
    pduree = [NSMutableArray array];
    pPosDebPr = [NSMutableArray array];
    pLien = [NSMutableArray array];
    pDecal = [NSMutableArray array];
    pMgT = [NSMutableArray array];
    nombrePredecesseur = 0;
}
    
-(void)ajouterPredecesseur:(NSString *)numero_ :(NSString *)pnumero_ :(NSString *)pdesignation_ :(NSString *)pduree_ :(NSString *)pPosDebPr_ :(NSString *)pLien_ :(NSString *)pDecal_ :(NSString *)pMgT_{
    
    [numero addObject:numero_];
    [pnumero addObject:pnumero_];
    [pdesignation addObject:pdesignation_];
    [pduree addObject:pduree_];
    [pPosDebPr addObject:pPosDebPr_];
    [pLien addObject:pLien_];
    [pDecal addObject:pDecal_];
    [pMgT addObject:pMgT_];
    nombrePredecesseur++;
}
-(void)afficherPredecesseur{
    
    for (int i = 0; i<nombrePredecesseur;i++)
    {
        NSLog(@"Tache %@ Predecesseur numero %@ avec la designation %@ et de la duree %@ et PosDebPr %@ et lien %@ . Avec le décalage %@ et la marge %@ ",numero[i],pnumero[i],pdesignation[i],pduree[i],pPosDebPr[i], pLien[i],pDecal[i],pMgT[i]);
    }
}
@end
