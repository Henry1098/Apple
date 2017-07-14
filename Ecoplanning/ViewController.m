//
//  ViewController.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 05/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*  dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",@"1",@"numero",@"Tâche 1",@"designation",@"1",@"durpr",@"11/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr2",@"0",@"mgt", nil];
    [_arrayController addObject:dict];
    */}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

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
    [alert setMessageText:@"Ecoplanning fonctionne correctement"];
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
        dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",str,@"numero",str2,@"designation",@"1",@"durpr",@"13/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr2",@"0",@"mgt", nil];
        [_arrayController addObject:dict];
        [check setTag:i];
    
    }
    
    i++;
}
- (IBAction)bb:(id)sender {
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:false], @"check",@"31",@"numero",@"Tachhen 3",@"designation",@"1",@"durpr",@"13/07/17",@"debpr",@"12/07/17",@"finpr",@"11/07/17",@"debpr1",@"12/07/17",@"finpr2",@"0",@"mgt", nil];
    
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

@end
