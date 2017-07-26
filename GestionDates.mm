//
//  GestionDates.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 26/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "GestionDates.h"
#import "Dates.hpp" // Codé en C++, pour la gestion des Dates

@implementation GestionDates

-(NSDate *)calcdates:(NSDate *) datum:(int) jour
{
    time_t datee = (time_t) [datum timeIntervalSince1970];
    Dates *dateeco = new Dates();
    NSDate *fin = [NSDate dateWithTimeIntervalSince1970:dateeco->calculdates(datee, jour)];
    
    return fin;
}
@end
