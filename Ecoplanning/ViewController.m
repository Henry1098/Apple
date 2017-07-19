//
//  ViewController.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 05/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
int nbreTaches;

- (void)viewDidLoad {
    [super viewDidLoad];
/*  dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",@"1",@"numero",@"Tâche 1",@"designation",@"1",@"durpr",@"11/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr2",@"0",@"mgt", nil];
    [_arrayController addObject:dict];
    */
    tableView.delegate = self;
    



}

- (IBAction)colonnes:(id)sender {
    if([tableView selectedColumn ]== 4)
    {
        NSAlert *alert = [[NSAlert alloc]init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"str"];
        [alert runModal];
    }
}

- (IBAction)duree:(NSTextFieldCell *)sender {
  int dureeV = [sender integerValue];
    NSString *str = [NSString stringWithFormat:@"%d",dureeV];
    NSAlert *alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:str];
    [alert runModal];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

}



-(void)controlTextDidEndEditing:(NSNotification *)obj{
    cell = [[tableView selectedCell]stringValue];
    NSAlert *alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:cell];
        [alert runModal];
    

}


- (IBAction)check:(NSButtonCell *)sender {
    NSInteger selected = [tableView selectedRow];
    NSString *str;
    str = [[NSString alloc]initWithFormat:@"%d",(int) selected];
    
    NSAlert *alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:str];
    [alert runModal];


}

- (IBAction)message:(id)sender {    NSAlert *alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:[NSString stringWithFormat:@"%d",nbreTaches]];
    [alert runModal];
}
- (IBAction)numberdisplay:(id)sender {
   NSAlert * alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:[NSString stringWithFormat:@"%d",number]];
    [alert runModal];
}

-(void)keyDown:(NSEvent *)event
{
     static int i = 1;
    NSString * str = [NSString stringWithFormat:@"%i", i];
    NSMutableString *str2 = [NSMutableString string];
    [str2 appendString:@"Tâche "];
    [str2 appendString:str];
    
    if([event keyCode] == 0x22)
    {
        dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",str,@"numero",str2,@"designation",@"1",@"durpr",@"13/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr1",@"0",@"mgt", nil];

        checkState = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false],[NSNumber numberWithInteger:i], nil];
        [_arrayController addObject:dict];
        
        [check setTag:i];
    
    }
    nbreTaches = i;
    i++;
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
@end
