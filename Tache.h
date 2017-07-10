//
//  Tache.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 10/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#ifndef Tache_h
#define Tache_h

@interface Tache : NSObject{
    
    //Principal Task
    int numero;
    NSString * designation;
    int duree;
    NSDate *datedeb;
    NSDate *datefin;
    NSDate *datedeb2;
    NSDate *datefin2;
    int marge;
    int cal;
    NSDate *debcont;
    NSDate *fincont;
    NSString *codeTache;
    NSString *phase;
    NSString *intervenant;
    NSString *tri;
    int cout;
    int coutR;
    NSString *champsLibre;
    
    //Prédecesseur de la tâche
    NSMutableArray *numeropred;
    NSMutableArray *designationpred;
    NSMutableArray *dureepred;
    NSMutableArray *PosDebPr;
    NSMutableArray *Lien;
    NSMutableArray *Decal;
    NSMutableArray *Mgt;
    
    //Successeur de la tâche
    NSMutableArray *numerosucc;
    NSMutableArray *designationsucc;
    NSMutableArray *dureesucc;
    NSMutableArray *DebTot;
    NSMutableArray *LienSucc;
    NSMutableArray *DecalSucc;
    NSMutableArray *MgtSucc;
    NSMutableArray *DebTache;
    
    
}

-(NSDate *)calcdate:(NSDate *) datedebut : (int) jours;
-(BOOL)isWeekDay:(NSDate*) date;
-(NSDate*)verifjourdelasemaine:(NSDate *) date2;
-(NSDate*)ajouterjours:(NSDate *) date :(NSInteger) jours;


@property int numero,duree, marge, cout, coutR;
@property (copy) NSString *designation,*codeTache, *phase,*intervenant, *tri, *champsLibre;
@property NSDate *datedeb, *datefin, *datedeb2, *datefin2, *debcont, *fincont;
@property NSMutableArray *numeropred,*designationpred, *dureepred,*PosDebPr,*Lien, *Decal, *Mgt, *numerosucc, *designationsucc, *dureesucc, *DebTot, *LienSucc, *DecalSucc,*MgtSucc, *DebTache;
@end

#endif /* Tache_h */
