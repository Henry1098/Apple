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
Journeedelasemaine jdls;
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
    toutlesdurees = [NSMutableArray array];
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
        tache.debcont = @"01/12/14";
        tache.fincont =@"02/12/15con";
        
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
    
    
    for (int i = 0; i < [toutlesdurees count]; i++) {
       //
        if ([[toutlesdurees objectAtIndex:i]intValue]>mgtmp) {
            mgtmp=[[toutlesdurees objectAtIndex:i]intValue];
        }
    }
    
    for (int k = 0; k < [tableView numberOfRows]; k++) {
        
    NSString *durpr= [[[_arrayController arrangedObjects]objectAtIndex:k]valueForKey:@"durpr"];
      mgt_ = mgtmp-[durpr intValue];
        
        [[[_arrayController arrangedObjects]objectAtIndex:k]setValue:[NSString stringWithFormat:@"%d",mgt_] forKey:@"mgt"];
    }
    
    
    
    
    
}
-(void)tableView:(NSTableView *)tableView didClickTableColumn:(nonnull NSTableColumn *)tableColumn{
    
    if([[tableColumn identifier]isEqualToString:@"debcont"] )
    {
        NSLog(@"debcont");
    }
}
-(void)controlTextDidEndEditing:(NSNotification *)obj
{
    int row = [tableView selectedRow];
    
    
    NSString * str = [obj.object stringValue];
    NSString *durpr = [[[_arrayController arrangedObjects]objectAtIndex:row]valueForKey:@"durpr"];
    
    int nr = (int)[obj.object editedColumn];
   
    if([str length] > 3)
    {
        NSLog(@"%@", str);
        NSLog(@"%@", [NSString stringWithFormat:@"%d",nr]);
        [form setDateFormat:@"dd/MM/yy"];
        if([form dateFromString:str])
        {
            if(nr ==9) // Debut contrainte
            {
                //Date au bon format
                NSString *debpr = [[[_arrayController arrangedObjects]objectAtIndex:row]valueForKey:@"debpr"];
                
                double doe = [gestion diffdate:[form dateFromString:str] :[form dateFromString:debpr]];
                
                
                [[[_arrayController arrangedObjects]objectAtIndex:row]setValue:str forKey:@"debpr"];
                
                NSDate * fin;
                NSDate * date = [form dateFromString:str];
                int days = (int)doe;
                fin = [gestion calcdates:date :days];
                
                [[[_arrayController arrangedObjects]objectAtIndex:row]setValue:[form stringFromDate:fin] forKey:@"finpr"];
                
                NSLog(@"%f",doe);
                
                NSLog(@"%d Column modified",nr);
                NSLog(@"YES");
                NSLog(@"Column number 9");
            }
            if(nr == 10) //Fin contrainte
            {
                //Date au bon format
                NSString *finpr = [[[_arrayController arrangedObjects]objectAtIndex:row]valueForKey:@"finpr"];
                
                NSString *durpr = [[[_arrayController arrangedObjects]objectAtIndex:row]valueForKey:@"durpr"];
                
                
                double doe = [gestion diffdate:[form dateFromString:str] :[form dateFromString:finpr]];
                
                
                [[[_arrayController arrangedObjects]objectAtIndex:row]setValue:str forKey:@"finpr"];
                
                NSDate * fin;
                NSDate * date = [form dateFromString:str];
                int days = [durpr intValue];
                fin = [gestion retirerdates:date :days];
                
                [[[_arrayController arrangedObjects]objectAtIndex:row]setValue:[form stringFromDate:fin] forKey:@"debpr"];
                
                [tableView reloadData];
                NSLog(@"Column number 10");
            }
          
        }else{
            // Date pas au bon format
            return;
        }
    }else{
    [toutlesdurees addObject:str];
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
    int j =0;
    int k = 0;
    int l = 0;
    int r = 0;
    int s = 0;
    int t = 0;
    int u =0;
    int v = 0;
    
 
    
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
            if([predArray doesContain:pred]){
                
            }else{
            [predArray addObject:pred];
                [predTable reloadData];}
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
            NSLog(@"Successeur crée");
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
 NSString *debpr = [[[_arrayController arrangedObjects]objectAtIndex:row]valueForKey:@"debpr"];
    NSDate *debprdate = [form dateFromString:debpr];
    NSDateComponents * comps = [[NSCalendar currentCalendar] components:NSCalendarUnitDay|NSCalendarUnitMonth fromDate:debprdate];
    NSInteger day = [comps day];
    NSInteger month = [comps month];
    NSInteger year = [comps year];
    
    dureeglobale= [durpr intValue]+2;
    selectiontache = YES;
    gantt.needsDisplay = YES;
    NSLog(@"%ld Day and %ld ",(long)day, (long)month);
    
    
    
    
}


// Gantt après liaison des tâches
-(void)dessinergantt2:(NSString *)designation :(int)decalage :(NSString *)lien
{
    
}


@end
