//
//  Globals.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Globals.h"

@implementation Globals

@synthesize datedebutProjet,dateAvancement;
@synthesize codeProjet, titreProjet, Observations;

-(void)changementDateDebut:(NSDate*) datedeb
{
    datedebutProjet = datedeb;
}




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
    while([self isWeekDay:date2])
    {
        date2 = [self ajouterjours:date2:1];
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
                end = [self verifjourdelasemaine:end];
                
                end = [self ajouterjours:end:1];
                
            }
            
            
            
            
            
        }
    
    return datedebut;
}


@end
