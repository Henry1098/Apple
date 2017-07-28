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
#import "Successeur.h"
#import "Predecesseur.h"

@implementation ViewController
int nbreTaches;
NSDate *datedebutProjet;
NSDate *datefin;
BOOL etatProjet;
GestionDates *gestion;
Successeur *successeur ;
Predecesseur *predeccesseur;
Globals *globals;
LienTache lientache;

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
    gestion = [[GestionDates alloc]init];
    globals = [[Globals alloc]init];
    checkState = [NSMutableArray array];
    successeur = [[Successeur alloc]init];
    [successeur initialize];
    predeccesseur = [[Predecesseur alloc]init];
    [predeccesseur initialize];
    [dureeprev setFormatter:entier];
    form = [[NSDateFormatter alloc]init];
    comp =[[NSDateComponents alloc]init];
    cal =[NSCalendar currentCalendar];
    [form setDateFormat:@"dd/MM/yy"];    
    
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

}

- (IBAction)calcduree:(id)sender {
    NSLog(@"Hello");
}

- (IBAction)message:(id)sender {    NSAlert *alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:[NSString stringWithFormat:@"%d",nbreTaches]];
    [alert runModal];
}
- (IBAction)numberdisplay:(id)sender {
   NSAlert * alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"datedebutProjet"];
    [alert runModal];
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
        dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], @"check",str,@"numero",str2,@"designation",@"1",@"durpr",datedebutProjet,@"debpr",datefin,@"finpr",datedebutProjet,@"debpr1",datefin,@"finpr1",@"0",@"mgt", nil];

      
        [_arrayController addObject:dict];
        
        [check setTag:i];
    
    
    nbreTaches = i;
        i++;}
}
- (IBAction)bb:(id)sender {
    [_arrayController removeObjectAtArrangedObjectIndex:3];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], @"check",@"31",@"numero",@"Tachhen 3",@"designation",@"1",@"durpr",@"13/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr1",@"0",@"mgt", nil];
    
    [_arrayController insertObject:dict atArrangedObjectIndex:3];
   NSString *str = [[[_arrayController arrangedObjects]objectAtIndex:4]valueForKey:@"designation"];
[tableView reloadData];
    
    NSAlert *alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:str];
    [alert runModal];

}
-(BOOL)acceptsFirstResponder{
    return YES;
}


- (IBAction)foot:(id)sender {
    BOOL etat;
    
    int selection = [tableView selectedRow];

       etat = [[[_arrayController arrangedObjects]objectAtIndex:selection]valueForKey:@"check"];

    NSString *str = [NSString stringWithFormat:@"%d",etat];
    NSAlert *alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:str];
    [alert runModal];

    

}
-(void)controlTextDidEndEditing:(NSNotification *)obj
{
    int row = [tableView selectedRow];
 
    [self calculduree2:4:row];
}

- (IBAction)bre:(id)sender {
    
    lientache.FD = YES;
        NSLog(@"%@",checkState);
    int counter = (int) [checkState count];
    int counter2 = (int)[checkState count]-1;
    NSString *str;
    NSString *des;
    NSString *duree;
    NSString* debpr;
    NSString* Mgt;
        NSString *str2;
        NSString *des2;
        NSString *duree2;
        NSString* debpr2;
        NSString* Mgt2;
    int i = 0;
    
    while (i< counter)
    {
        str = [checkState objectAtIndex:i];

         des = [[[_arrayController arrangedObjects]objectAtIndex:i+1]valueForKey:@"designation"];
        duree =[[[_arrayController arrangedObjects]objectAtIndex:i+1]valueForKey:@"durpr"];
      debpr = [[[_arrayController arrangedObjects]objectAtIndex:i]valueForKey:@"debpr"];
      Mgt = [[[_arrayController arrangedObjects]objectAtIndex:i+1]valueForKey:@"mgt"];
        if(i <= counter2 && [checkState[i] intValue] > [checkState[0] intValue]&&i < counter2){
       str2 = [checkState objectAtIndex:i-1];
        des2 = [[[_arrayController arrangedObjects]objectAtIndex:i-1]valueForKey:@"designation"];
      duree2 =[[[_arrayController arrangedObjects]objectAtIndex:i-1]valueForKey:@"durpr"];
        debpr2= [[[_arrayController arrangedObjects]objectAtIndex:i]valueForKey:@"debpr"];
       Mgt2 = [[[_arrayController arrangedObjects]objectAtIndex:i-1]valueForKey:@"mgt"];
        }
        
        if(i== (int)[checkState[0] intValue])
        {
          
            [successeur ajouterSuccesseur:[checkState firstObject] :str :des :duree :debpr :[globals renvoiLien] :@"0" :Mgt :debpr];
        }
        if(i <= counter2&& [checkState[i] intValue]> [checkState[0] intValue]&& i<counter2){
            [predeccesseur ajouterPredecesseur: [checkState objectAtIndex:i-1]:str2 :des2 :duree2 :debpr2 :[globals renvoiLien] :@"0" :Mgt2];
            
            [successeur ajouterSuccesseur:[checkState objectAtIndex:i+1] :str :des :duree :debpr :[globals renvoiLien] :@"0" :Mgt :debpr];
            
            
            
        }
        
        i++;
        
    }
    
    [predeccesseur afficherPredecesseur];
    [successeur afficherSuccesseur];
}


- (IBAction)checkded:(NSButton *)sender {
    int Row = [tableView selectedRow];
    
      NSString *check = [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"check"];
    int checkd = [NSString stringWithFormat:@"%@",check];
    
   NSString *str= [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"numero"];
    if(checkd == 12565)
    {
        NSLog(@"Yep tu as coché la tâche numéro %d",Row);
        [checkState addObject:str];
    }
    if(checkd == 12309)
    {
        NSLog(@"Bouh, tu viens de décocher la tâche numéro %d", Row);
        [checkState removeObject:str];
        
    }
  }

-(void)calculduree2:(int)number:(int)Row
{
     int row = [tableView selectedRow];
    NSString *durpr = [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"durpr"];
    
    NSString *debpr = [[[_arrayController arrangedObjects]objectAtIndex:Row]valueForKey:@"debpr"];
   int a =[durpr intValue];

    NSDate *f =[form dateFromString:debpr];
   switch (a) {
        case 0:
            NSLog(@"Number 0");
            break;
           
        default:
           comp.day = a-1;
           NSDate * fin = [cal dateByAddingComponents:comp toDate:f options:nil];
       [form setDateFormat:@"dd/MM/yy"];
        fin=   [form stringFromDate:fin];
           
           
           
           [dict setObject:fin forKey:@"finpr"];
           [dict setObject:fin forKey:@"finpr1"];
           [dict setObject:[NSNumber numberWithInt:row] forKey:@"numero"];
           [dict setObject:[NSString stringWithFormat:@"Tâche %d",row] forKey:@"designation"];
           
           [_arrayController removeObjectAtArrangedObjectIndex:Row];
           [_arrayController insertObject:dict atArrangedObjectIndex:Row];

           NSLog(@"%@",fin);
           
       break;     }
    


}

-(void)executerLiens
{
 
    
    
}

@end
