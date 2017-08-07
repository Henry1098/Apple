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
#import "Tache.h"

@implementation ViewController
int nbreTaches;
NSDate *datedebutProjet;
NSDate *datefin;
BOOL etatProjet;
Globals *globals;
LienTache lientache;
NSMutableArray *array;
NSMutableArray *tachescochees;
GestionDates *gestion;
static int counterliaison; // Compte les nombres des fois qu'une liaison est effectué
NSMutableArray *array;
Tache *tache; //pour inserer les taches
NSMutableArray* touteslestaches;

- (void)viewDidLoad {
    [super viewDidLoad];
/*  dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",@"1",@"numero",@"Tâche 1",@"designation",@"1",@"durpr",@"11/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr2",@"0",@"mgt", nil];
    [_arrayController addObject:dict];
    */
    
    tableView.delegate = self;
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
        
        
    /*    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], @"check",str,@"numero",str2,@"designation",@"1",@"durpr",datedebutProjet,@"debpr",datefin,@"finpr",datedebutProjet,@"debpr1",datefin,@"finpr1",@"0",@"mgt", nil];

      */
        
        
        [_arrayController addObject:tache];
        [tableView reloadData];
        [check setTag:i];
    
    
    nbreTaches = i;
        i++;
        [touteslestaches addObject:tache];
    }
}


-(BOOL)acceptsFirstResponder{
    return YES;
}


-(void)controlTextDidEndEditing:(NSNotification *)obj
{
    int row = [tableView selectedRow];
    
    [self calculduree2:4:row];
}

- (IBAction)bre:(id)sender {

    [self lierVersionUnPred];
    [self lierVersionUnSucc];

}

-(void)lierVersionUnSucc
{
    tachescochees =  checkState;
    lientache.FD = YES;
    int j = 0;
    int nt = 0;
    static int counter;
    counter = (int)checkState.count;
    for(int i= 0;i <counter;i++){
        if(i==(int)checkState.count)
        {
            return;
        }
        if(i!=(int)checkState.count){
            nt = [[checkState objectAtIndex:i+1]intValue];}
        
        
        if(nt != [[checkState lastObject]intValue]){
            
            NSString *designation= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"designation"];
            
            NSString *duree= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"durpr"];
            
            NSString *pPosDebpr= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"finpr"];
            
            
            
            NSString *MgT= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"mgt"];
            
        
        }else{
            
            return;
        }
    }
    
}
-(void)lierVersionUnPred
{
    
    tachescochees =  checkState;
    lientache.FD = YES;
    int j = 0;
    int nt = 0;
    static int counter;
    counter = (int)checkState.count;
    for(int i= 0;i <counter;i++){
        if(i==0)
        {
            nt = [[checkState objectAtIndex:i]intValue];
        }
        if(i!=0){
            nt = [[checkState objectAtIndex:i-1]intValue];}
        
        
        if(nt != [[checkState firstObject]intValue]){
            
            NSString *designation= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"designation"];
            
            NSString *duree= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"durpr"];
            
            NSString *pPosDebpr= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"finpr"];
            
            
            
            NSString *MgT= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"mgt"];
            
        }else{
            
            
            NSString *designation= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"designation"];
            
            NSString *duree= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"durpr"];
            
            NSString *pPosDebpr= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"finpr"];
            
            
            
            NSString *MgT= [[[_arrayController arrangedObjects]objectAtIndex:nt]valueForKey:@"mgt"];
            
        }
    }
}
- (IBAction)checkded:(NSButton *)sender {
    int Row = [tableView selectedRow];
    NSString *check = [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"check"];
    int checkd = [NSString stringWithFormat:@"%@",check];
    
   NSString *str= [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"numero"];
    if(checkd == 12565)
    {
        NSLog(@"Yep tu as coché la tâche numéro %d",Row);
        [array addObject:str];
    }
    if(checkd == 12309)
    {
        NSLog(@"Bouh, tu viens de décocher la tâche numéro %d", Row);
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
    
    
}

-(void) creerdesPredecesseurs
{
    Predecesseur *pred;
    pred = [[Predecesseur alloc]init];
    
   // [pred creerPredecesseur:<#(NSDate *)#> :<#(NSString *)#> //:<#(NSMutableArray *)#> :<#(NSString *)#> :<#(NSString *)#> :<#(NSString *)#>]

}
@end
