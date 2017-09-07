//
//  GestionDates.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 26/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GestionDates : NSObject
-(NSDate *)calcdates:(NSDate *) datum:(int) jour;
-(int)weekday:(NSDate *)date;
-(double)diffdate:(NSDate *)date1:(NSDate *)date2;

-(NSDate *)retirerdates:(NSDate *) datum:(int) jour;
@end
