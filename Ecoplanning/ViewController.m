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

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, isf already loaded.
}

- (IBAction)message:(id)sender {
NSString *str = @"Hello World";
    NSAlert *alert = [[NSAlert alloc]init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"Ecoplanning fonctionne correctement"];
    [alert runModal];
}

- (IBAction)message2:(id)sender {
    
}
- (IBAction)message3:(id)sender {
    
}

@end
