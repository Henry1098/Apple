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
    time_t  date = dateeco->calculdates(datee, jour);
    NSDate *fin = [NSDate dateWithTimeIntervalSince1970:date];
    NSDateFormatter * form;
    [form setDateFormat:@"dd/MM/yy"];
    return fin;
}

-(int)weekday:(NSDate *)date
{
    time_t datee = (time_t) [date timeIntervalSince1970];
    Dates *dateeco = new Dates();
    int weekday = dateeco->retourweekday(datee);
    return weekday;
    
}

-(double)diffdate:(NSDate *)date1:(NSDate *)date2
{
    Dates *dateeco = new Dates();
    time_t date1_ = (time_t)[date1 timeIntervalSince1970];
    time_t date2_ = (time_t)[date2 timeIntervalSince1970];
    
    double diff =(dateeco->differencedates(date1_, date2_)/86400.00);
    diff--;
    return diff;
}

-(NSDate *)retirerdates:(NSDate *)datum :(int)jour
{
    
    time_t datee = (time_t) [datum timeIntervalSince1970];
    Dates *dateeco = new Dates();
    time_t  date = dateeco->retirerdates(datee, jour);
    NSDate *fin = [NSDate dateWithTimeIntervalSince1970:date];
    NSDateFormatter * form;
    [form setDateFormat:@"dd/MM/yy"];
    return fin;
    
}
@end
