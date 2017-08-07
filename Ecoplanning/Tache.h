//
//  Tache.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tache : NSObject
{
    NSString* check;
    NSString* numero;
    NSString* designation;
    NSString* durpr;
    NSString* debpr;
    NSString* finpr;
    NSString* debpr1;
    NSString* finpr1;
    NSString* mgt;
}

@property (copy) NSString* check,* numero,* designation,* durpr,* debpr,* finpr,* debpr1,* finpr1,* mgt;
@end
