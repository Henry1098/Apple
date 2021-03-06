//
//  NouveauProjet.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "NouveauProjet.h"
#import "Globals.h"
@interface NouveauProjet ()

@end
int annee_;
@implementation NouveauProjet
- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (IBAction)annuler:(id)sender {
    [self close];
}
- (IBAction)dateSelection:(id)sender {
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd/MM/yy"];
    strDate =  [format stringFromDate:[calendrier dateValue]];
    
    dateD.stringValue = strDate;
    [self setDateFin];
    
    [format setDateFormat:@"dd/MM/yyyy"];

    annee_ = [self setAnnee:[format dateFromString:strDate]];
}
- (IBAction)sauver:(id)sender {
    
    datedebutProjet = dateD.stringValue;
    etatProjet = true;
    
    [self close];
}

-(void) setDateFin{
    NSDateFormatter *form =[[NSDateFormatter alloc]init];
    [form setDateFormat:@"dd/MM/yy"];
    NSDate * date=  [form dateFromString:strDate];
    NSDateComponents * comp = [[NSDateComponents alloc]init];
    comp.day = 1;
    NSCalendar *cal = [NSCalendar currentCalendar];
    datefin=[form stringFromDate:[cal dateByAddingComponents:comp toDate:date options:0]];
    
}


-(int)setAnnee:(NSDate *)date
{
    NSDateComponents * comps = [[NSCalendar currentCalendar] components:NSCalendarUnitDay|NSCalendarUnitMonth fromDate:date];
     int year = (int)[comps year];
    return year;

}


@end
