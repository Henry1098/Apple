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
    NSString* check;
    NSString* numero;
    NSString* designation;
    NSString* durpr;
    NSString* debtot;
    NSString* lien;
    NSString* decal;
    NSString* mgt;
    NSString* debavtache;
}
@property (copy) NSString* check,*numero, *designation, *durpr, *debtot,*lien,*decal, *mgt,*devavtache;
-(Successeur *)creerSuccesseur:(NSDate *) date:(int) i:(NSMutableArray *) array:(NSString *) designation:(int) durpr:(int) mgt;
-(NSString *)verifLien;
@end
