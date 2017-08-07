//
//  Successeur.h
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Successeur : NSObject
{
    NSMutableArray* check;
    NSMutableArray* numero;
    NSMutableArray* designation;
    NSMutableArray* durpr;
    NSMutableArray* debtot;
    NSMutableArray* lien;
    NSMutableArray* decal;
    NSMutableArray* mgt;
    NSMutableArray* debavtache;
}
@property (copy) NSMutableArray* check,*numero, *designation, *durpr, *debtot,*lien,*decal, *mgt,*devavtache;

@end
