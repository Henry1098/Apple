//
//  Globals.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Globals : NSObject

+(NSString *)renvoiLien;

typedef struct{
    BOOL FD;
    BOOL FF;
    BOOL DD;
} LienTache;


typedef struct{
    int lundi;
    int mardi;
    int mercredi;
    int jeudi;
    int vendredi;
    int samedi;
    int dimanche;
}Journeedelasemaine;

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
extern BOOL liaisontaches;
extern int dureeglobale;
extern BOOL selectiontache;
extern int tacheselectionne;
extern int colonneselectionne;
extern int annee_;
extern NSMutableArray *Mois;
extern NSMutableArray *datessel;
@end
