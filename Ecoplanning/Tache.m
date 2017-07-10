//
//  Tache.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 10/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tache.h"


@implementation Tache

Tache *tache;

-(BOOL)isWeekDay:(NSDate*) date{
     NSInteger semaine;
    NSCalendar *calendrier;
    NSDateComponents *comp = [calendrier components:NSCalendarUnitWeekday fromDate:date];
    semaine = [comp weekday];
    
    const int Samedi = 7;
    const int Dimanche = 1;
    
    BOOL isWeekdayResult = semaine != Dimanche && semaine != Samedi;
    return isWeekdayResult;
}



-(NSDate*)verifjourdelasemaine:(NSDate *) date2{
    NSInteger number = 1;    while(isWeekDay(date2))
    {
        date2 = [tache ajouterjours:date2:1];
    }
    return date2;
    
}

-(NSDate*)ajouterjours:(NSDate *) date :(NSInteger) jours
{
   
    NSDateComponents *components = [[NSDateComponents alloc]init];
    [components setDay:jours];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *resultat = [gregorian dateByAddingComponents:components toDate:date options:0];
    
    return resultat;

    
}
-(NSDate *)calcdate:(NSDate *) datedebut : (int) jours{
    
    NSDate * end = datedebut;
    
    if(jours == 1){
        return datedebut;}else{
            for (int i = 0; i < jours; i++)
            {
                end = [tache verifjourdelasemaine:end];
                
                end = [tache ajouterjours:end:1];
                
            }
            
            
            
            
            
               }
    
    return datedebut;
}

@synthesize numero,duree, marge, cout, coutR;
@synthesize designation,codeTache, phase,intervenant, tri, champsLibre;
@synthesize datedeb, datefin, datedeb2, datefin2, debcont, fincont;
@synthesize numeropred,designationpred, dureepred,PosDebPr,Lien, Decal, Mgt, numerosucc, designationsucc, dureesucc, DebTot, LienSucc, DecalSucc,MgtSucc, DebTache;

@end
