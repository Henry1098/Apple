//
//  Globals.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Globals.h"

@implementation Globals

+(NSString *)renvoiLien
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
    }
    
    return lien;
             
}
@end
