//
//  Tache.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Tache.h"

@implementation Tache
@synthesize check, numero, designation, durpr, debpr,finpr, debpr1, finpr1,mgt,debcont,fincont;


-(id)init{
    self = [super init];
    if(self)
    {
        check = nil;
        numero = @"";
        designation = @"";
        durpr = @"";
        debpr = @"";
        finpr = @"";
        debpr1 = @"";
        finpr1 = @"";
        mgt = @"";
        debcont = @"";
        fincont = @"";
    }
    
    return self;
}



@end
