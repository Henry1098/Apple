//
//  Predecesseur.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 28/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Predecesseur.h"
#import "Globals.h"

@implementation Predecesseur
@synthesize predecesseur;


-(void)initialize
{
    predecesseur = [[NSMutableDictionary alloc]init];
    nombrePredecesseur = 0;
    }
    
-(void)ajouterPredecesseur:(NSString *)numero_ :(NSString *)pnumero_ :(NSString *)pdesignation_ :(NSString *)pduree_ :(NSString *)pPosDebPr_ :(NSString *)pLien_ :(NSString *)pDecal_ :(NSString *)pMgT_{
    
    predecesseur = [NSMutableDictionary dictionaryWithObjectsAndKeys:numero_, @"numero", pnumero_,@"pnumero",pdesignation_, @"pdesignation",pduree_,@"pduree",pPosDebPr_,@"pPosDebPr",pLien_,@"pLien",pDecal_,@"pDecal",pMgT_,@"pMgT", nil];
    NSString *str = [predecesseur objectForKey:@"numero"];
    NSLog(@"Predecesseur : %@",str);
    nombrePredecesseur++;
}
@end
