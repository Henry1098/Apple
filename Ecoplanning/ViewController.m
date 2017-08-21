//
//  ViewController.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 05/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "ViewController.h"
#import "Globals.h"
#import "SeulementEntier.h"
#import "GestionDates.h"
#import "Predecesseur.h"
#import "Successeur.h"
#import "Tache.h"
#import "Gantt.h"

@implementation ViewController
int nbreTaches;
NSDate *datedebutProjet;
NSDate *datefin;
BOOL etatProjet;
Globals *globals;
NSMutableArray *array;
NSMutableArray *tachescochees;
GestionDates *gestion;
static int counterliaison; // Compte les nombres des fois qu'une liaison est effectué
NSMutableArray *array;
Tache *tache; //pour inserer les taches
BOOL liaison;
Predecesseur *pred;
Successeur *succ;
int tacheselectionne;

int dureeglobale;
BOOL selectiontache;

- (void)viewDidLoad {
    [super viewDidLoad];
/*  dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",@"1",@"numero",@"Tâche 1",@"designation",@"1",@"durpr",@"11/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr2",@"0",@"mgt", nil];
    [_arrayController addObject:dict];
    */
    
    tableView.delegate = self;
    predTable.delegate = self;
    SuccTable.delegate = self;
    tableView.action = @selector(selectionRow:);
    check.target = self;
    datum = datedebutProjet;
    etatProjet = false;
    SeulementEntier * entier = [[SeulementEntier alloc]init];
    array= [NSMutableArray array];
    globals = [[Globals alloc]init];
    checkState = [NSMutableArray array];
    tachescochees = [NSMutableArray array];
    [dureeprev setFormatter:entier];
    form = [[NSDateFormatter alloc]init];
    comp =[[NSDateComponents alloc]init];
    cal =[NSCalendar currentCalendar];
    [form setDateFormat:@"dd/MM/yy"];
    gestion = [[GestionDates alloc]init];
    touteslestaches = [NSMutableArray array];
    touteslessucc = [NSMutableArray array];
    liaison = NO;
    pred = [[Predecesseur alloc]init];
    succ = [[Successeur alloc]init];
}
- (IBAction)chelien:(id)sender {
    
    [self executerLiens];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

}

- (IBAction)calcduree:(id)sender {
    NSLog(@"Hello");
}

-(void)keyDown:(NSEvent *)event
{
     static int i = 1;
    NSString * str = [NSString stringWithFormat:@"%i", i];
    NSMutableString *str2 = [NSMutableString string];
    [str2 appendString:@"Tâche "];
    [str2 appendString:str];
    
    if([event keyCode] == 0x22 && etatProjet == true)
    {
        
        tache = [[Tache alloc]init];


        
        tache.check =[NSNumber numberWithBool:NO];
        tache.numero =str;
        tache.designation =str2;
        tache.durpr =@"1";
        tache.debpr =datedebutProjet;
        tache.finpr=datefin;
        tache.debpr1 =datedebutProjet;
        tache.finpr1 =datefin;
        tache.mgt =@"0";
        tache.debcont = @"Hello";
        tache.fincont =@"World";
        
    /*    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], @"check",str,@"numero",str2,@"designation",@"1",@"durpr",datedebutProjet,@"debpr",datefin,@"finpr",datedebutProjet,@"debpr1",datefin,@"finpr1",@"0",@"mgt", nil];

      */
        [touteslestaches addObject:tache];
    [_arrayController addObject:tache];
    [tableView reloadData];
        [check setTag:i];
    
    
    nbreTaches = i;
        i++;
       
        
        
          }
}


-(BOOL)acceptsFirstResponder{
    return YES;
}


-(void)calculMarge
{
    int mgtmp =0;
    int mgt_;
    for (int i = 0; i < [tableView numberOfRows]; i++) {
 NSString *mgt = [[[_arrayController arrangedObjects]objectAtIndex:i]valueForKey:@"mgt"];
        
        if(mgtmp < [mgt intValue])
        {
            mgtmp = [mgt intValue];
        }
        
        for (int k = 0; k <[tableView numberOfRows]; k++) {

            
            NSString *duree = [[[_arrayController arrangedObjects]objectAtIndex:i]valueForKey:@"durpr"];
            int duree_ = [duree intValue];
          mgt_=mgtmp-duree_;
            
            [[[_arrayController arrangedObjects]objectAtIndex:k]setValue:[NSString stringWithFormat:@"%d",mgt_] forKey:@"mgt"];

        }
        
        
    }
    
}

-(void)controlTextDidEndEditing:(NSNotification *)obj
{
    int row = [tableView selectedRow];
  
    NSString * str = [obj.object stringValue];
    int nr = (int)[obj.object clickedColumn];

              if([str length] > 3)
    {
        NSLog(@"%@", str);
        NSLog(@"%@", [NSString stringWithFormat:@"%d",nr]);
    }else{
    [self calculduree2:4:row];
    [self calculMarge];
    [self dessinergantt1:row];
    }
}

- (IBAction)bre:(id)sender {



}



- (IBAction)checkded:(id)sender {
NSInteger Row = [tableView selectedRow];
    NSString *check = [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"check"];
    int checkd = [NSString stringWithFormat:@"%@",check];
    
   NSString *str= [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"numero"];
   
    if(checkd == 12565)
    {
        NSLog(@"Yep tu as coché la tâche numéro %ld",(long)Row);
        [array addObject:str];
    }
    if(checkd == 12309)
    {
        NSLog(@"Bouh, tu viens de décocher la tâche numéro %ld", (long)Row);
         [array removeObject:str];
        
    }
    
     checkState = [array sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
  }

-(void)calculduree2:(int)number:(int)Row
{
    
    int row = [tableView selectedRow];
    NSString *durpr = [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"durpr"];
    NSDate *fin;
    NSString *debpr = [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"debpr"];
   int a =[durpr intValue];

    NSDate *f =[form dateFromString:debpr];
   switch (a) {
        case 0:
            NSLog(@"Number 0");
            break;
           
        default:
/*           comp.day = a-1;
           NSDate * fin = [cal dateByAddingComponents:comp toDate:f options:nil];
       [form setDateFormat:@"dd/MM/yy"];
        fin=   [form stringFromDate:fin];
  */
          fin =[form stringFromDate:[gestion calcdates:f :a]];
           
           [[[_arrayController arrangedObjects]objectAtIndex:row]setValue:fin forKey:@"finpr"];
           
           
           
                      NSLog(@"%@",fin);
           
       break;     }
    


}

-(void)executerLiens
{
    int nt;
     int nt2 = 0;
    NSDate *date;
    NSString *fin = [NSString string];
    NSString *datefinx;
    const int counter = (int)[checkState count ] ;
    liaison = YES;
    
    for (int i=0; i<[checkState count]; i++) {
    
    int nt1 =     [[array objectAtIndex:i]intValue];
        NSLog(@"Execution terminée %d",nt1);
        if(nt1 == 1){
          NSString *finpr = [[[_arrayController arrangedObjects]objectAtIndex:nt1]valueForKey:@"finpr"];
        
           date= [gestion calcdates:[form dateFromString:finpr] :2];
        }else{
                
                NSString *finpr = [[[_arrayController arrangedObjects]objectAtIndex:nt1]valueForKey:@"finpr"];
                
                 NSString *durpr = [[[_arrayController arrangedObjects]objectAtIndex:nt1]valueForKey:@"durpr"];
                [form setDateFormat:@"dd/MM/yy"];
                date= [gestion calcdates:[form dateFromString:finpr] :2];
            [form setDateFormat:@"dd/MM/yy"];
              fin = [gestion calcdates:date:2];
            
            [form setDateFormat:@"dd/MM/yy"];

            [[[_arrayController arrangedObjects]objectAtIndex:nt1-1]setValue:[form stringFromDate:date] forKey:@"finpr"];
                
                
                
            }
        if(i<[array count]-1){
     int d = [[array objectAtIndex:i+1]intValue];
            [form setDateFormat:@"dd/MM/yy"];

               [[[_arrayController arrangedObjects]objectAtIndex:d-1]setValue:[form stringFromDate:date] forKey:@"debpr"];
            
            
        NSLog(@"Execution i %d",d);
        }

    
    }}
  
    
    



-(void) creerdesPredecesseurs
{
    Predecesseur *pred;
    pred = [[Predecesseur alloc]init];
    
   // [pred creerPredecesseur:<#(NSDate *)#> :<#(NSString *)#> //:<#(NSMutableArray *)#> :<#(NSString *)#> :<#(NSString *)#> :<#(NSString *)#>]

}

-(void)selectionRow:(id)sender
{
    
    
    
    
    
    int row = [tableView selectedRow];
    tacheselectionne = row;
    [self dessinergantt1:row];
    int j,k,l,r,s,t = 0,u,v = 0;
    
 
    
    for (j = 0; j < [array count]; j++) {
        k = [[array objectAtIndex:j]intValue];
         NSString *durpr = [[[_arrayController arrangedObjects]objectAtIndex:k]valueForKey:@"durpr"];
        if(j < [array count] && k != [[array firstObject]intValue])
        l = [[array objectAtIndex:j-1]intValue];
        NSString* m = [NSString stringWithFormat:@"%d",l];
        k-=1;
        NSString * n = @"Tache ";
        NSString *o = [n stringByAppendingString:m];
        NSString * p = [NSString stringWithFormat:@"%d",l];
        if (liaison == YES && row ==k ) {
            NSLog(@"%d",row);
            
            NSDate *now =[form dateFromString:@"12/01/17"];
           pred= [pred creerPredecesseur:now:p :array :o :durpr :@"0"];
          //  [touteslespred addObject:pred];
            [predArray addObject:pred];
            [predTable reloadData];
        }
    }
    
    
    for (r = 0; r< [array count];r++) {
        s = [[array objectAtIndex:r]intValue];
        NSString *durpr = [[[_arrayController arrangedObjects]objectAtIndex:s]valueForKey:@"durpr"];
        if(t < [array count] && s != [[array firstObject]intValue])
            v = [[array objectAtIndex:r+1]intValue];
        NSString*w = [NSString stringWithFormat:@"%d",v];
        s-=1;
        NSString * x = @"Tache ";
        NSString *y = [x stringByAppendingString:w];
        NSString * z = [NSString stringWithFormat:@"%d",v];
        if (liaison == YES && row ==s ) {
            NSLog(@"%d",row);
            
            NSDate *now =[form dateFromString:@"12/01/17"];
            succ= [succ creerSuccesseur:now:z :array :y :durpr :@"0"];
             [touteslessucc addObject:succ];
            [SuccArray addObject:succ];
            [SuccTable reloadData];
        }

    }
    
}
-(void)donneesgantt:(NSString *)designation:(int) decalage:(NSString *)lien
{
   if(liaison == NO)
   {
       
       [self dessinergantt1:designation];
       
   }else{
       
       [self dessinergantt2:designation :decalage :lien];
   }
    
    
}

//Gantt avant liaison des tâches
-(void)dessinergantt1:(int)row{
    NSString *durpr = [[[_arrayController arrangedObjects]objectAtIndex:row]valueForKey:@"durpr"];

    
    dureeglobale= [durpr intValue]+2;
    selectiontache = YES;
    gantt.needsDisplay = YES;

    
    
    
    
}


// Gantt après liaison des tâches
-(void)dessinergantt2:(NSString *)designation :(int)decalage :(NSString *)lien
{
    
}
@end
