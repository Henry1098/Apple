//
//  Predecesseur.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 28/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Predecesseur : NSObject
{
    NSMutableArray *numero;
    NSMutableArray *pnumero;
    NSMutableArray *pdesignation;
    NSMutableArray *pduree;
    NSMutableArray *pPosDebPr;
    NSMutableArray *pLien;
    NSMutableArray *pDecal;
    NSMutableArray *pMgT;
    int nombrePredecesseur;
}
@property (copy) NSMutableArray *numero, *pnumero,*pdesignation, *pduree, *pPosDebPr, *pLien, *pDecal, *pMgT;
@property int nombrePredecesseur;

-(void)initialize;
-(void)ajouterPredecesseur:(NSString *)numero_:(NSString *)pnumero_:(NSString *)pdesignation_:(NSString *)pduree_:(NSString *)pPosDebPr_:(NSString *)pLien_:(NSString *)pDecal_:(NSString *)pMgT_;
-(void)afficherPredecesseur;
@end
