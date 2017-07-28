//
//  Successeur.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 28/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Successeur : NSObject
{
    NSMutableArray *numero;
    NSMutableArray *snumero;
    NSMutableArray *sdesignation;
    NSMutableArray *sduree;
    NSMutableArray *sDebTot;
    NSMutableArray *sLien;
    NSMutableArray *sDecal;
    NSMutableArray *sMgT;
    NSMutableArray *DebavTache;
    
}

@property NSMutableArray *numero, *snumero,*sdesignation, *sduree, *sDebTot, *sLien, *sDecal, *sMgT, *DebavTache;
-(void)initialize;
-(void)ajouterSuccesseur:(NSString *)numero_:(NSString *)snumero_:(NSString *)sdesignation_:(NSString *)sduree_:(NSString *)psDebTot_:(NSString *)sLien_:(NSString *)sDecal_:(NSString *)sMgT_:(NSString *)DebavTache_;

@end
