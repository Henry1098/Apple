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

@implementation ViewController
int nbreTaches;
NSDate *datedebutProjet;
NSDate *datefin;
BOOL etatProjet;
GestionDates *gestion;
- (void)viewDidLoad {
    [super viewDidLoad];
/*  dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",@"1",@"numero",@"Tâche 1",@"designation",@"1",@"durpr",@"11/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr2",@"0",@"mgt", nil];
    [_arrayController addObject:dict];
    */
    
    tableView.delegate = (id)self;
    datum = datedebutProjet;
    etatProjet = false;
    SeulementEntier * entier = [[SeulementEntier alloc]init];
    gestion = [[GestionDates alloc]init];
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
        dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",str,@"numero",str2,@"designation",@"1",@"durpr",datedebutProjet,@"debpr",datefin,@"finpr",datedebutProjet,@"debpr1",datefin,@"finpr1",@"0",@"mgt", nil];

        checkState = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false],[NSNumber numberWithInteger:i], nil];
        [_arrayController addObject:dict];
        
        [check setTag:i];
    
    
    nbreTaches = i;
        i++;}
}
- (IBAction)bb:(id)sender {
    [_arrayController removeObjectAtArrangedObjectIndex:3];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",@"31",@"numero",@"Tachhen 3",@"designation",@"1",@"durpr",@"13/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr1",@"0",@"mgt", nil];
    
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
    int Bol= [tableView selectedColumn];
    int row = [tableView selectedRow];
 
    [self calculduree2:4:row];
}

-(void)calculduree2:(int)number:(int)Row
{
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
        
           NSLog(@"%@",fin);
       break;     }

}
@end
