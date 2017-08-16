//
//  Successeur.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Successeur.h"
#import "Globals.h"

@implementation Successeur

//LienTache lientache;

@synthesize check, numero, designation, durpr, debtot,lien,decal, mgt,devavtache;


-(id)init{
    self = [super init];
    if(self)
    {
        check= @"";
        numero = [NSString string];
        designation= [NSString string];
        durpr = [NSString string];
        debtot = [NSString string];
        lien = [NSString string];
        decal = [NSString string];
        mgt = [NSString string];
        devavtache = [NSString string];
        
    }
    
    return self;
}



-(Successeur *)creerSuccesseur:(NSDate *) date:(int) i:(NSMutableArray *) array:(NSString *) designation:(int) durpr:(int) mgt
{
    
    
    self.check = @"";
    self.numero = [NSString stringWithFormat:@"%d",i];
    self.designation = designation;
    self.durpr = [NSString stringWithFormat:@"%d",durpr];
    self.debtot = date;
    self.lien = @"FD";
    self.decal = @"0";
    self.mgt = [NSString stringWithFormat:@"%d",mgt];
    self.devavtache = date;
    return self;
}


-(NSString *)verifLien
{
    NSString *lien;
    if(lientache.DD == YES)
    {
        lien =@"DD";
    }
    if(lientache.FD == YES)
    {
        lien = @"FD";
    }
    if(lientache.FF ==YES)
    {
        lien= @"FF";
    }else{
        lien = @"";
    }
    
    return lien;
    
}


@end
