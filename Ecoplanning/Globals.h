//
//  Globals.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Globals : NSObject
{
    NSDate *datedebutProjet;
    NSDate *dateAvancement;
    NSString *codeProjet;
    NSString *titreProjet;
    NSString *Observations;
}

@property NSDate *datedebutProjet,*dateAvancement;
@property NSString *codeProjet, *titreProjet, *Observations;

-(void)changementDateDebut:(NSDate*) datedeb;
-(BOOL)isWeekDay:(NSDate*) date;
-(NSDate*)verifjourdelasemaine:(NSDate *) date2;
-(NSDate*)ajouterjours:(NSDate *) date :(NSInteger) jours;
-(NSDate *)calcdate:(NSDate *) datedebut : (int) jours;

@end
