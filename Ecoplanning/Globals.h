//
//  Globals.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Globals : NSObject

typedef struct{
    BOOL FD;
    BOOL FF;
    BOOL DD;
} LienTache;


    extern NSDate *datedebutProjet;
    extern NSDate *datefin;
    extern NSDate *dateAvancement;
    extern NSString *codeProjet;
    extern NSString *titreProjet;
    extern NSString *Observations;
    extern BOOL etatProjet;
    extern LienTache lientache;
    extern NSMutableArray *tachescochees;
    extern  int gcounterliaison;

    -(NSString *)renvoiLien;

@end
