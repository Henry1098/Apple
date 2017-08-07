//
//  Successeur.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Successeur.h"

@implementation Successeur
@synthesize check, numero, designation, durpr, debtot,lien,decal, mgt,devavtache;


-(id)init{
    self = [super init];
    if(self)
    {
        check= [NSMutableArray array];
        numero = [NSMutableArray array];
        designation= [NSMutableArray array];
        durpr = [NSMutableArray array];
        debtot = [NSMutableArray array];
        lien = [NSMutableArray array];
        decal = [NSMutableArray array];
        mgt = [NSMutableArray array];
        devavtache = [NSMutableArray array];
        
    }
    
    return self;
}
@end
