//
//  GestionSuccesseur.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 07/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "GestionSuccesseur.h"

@implementation GestionSuccesseur

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}



-(void)controlTextDidEndEditing:(NSNotification *)obj
{
    int row = [obj.object selectedColumn];
    
    NSLog(@"Column no %d",row);
}



-(BOOL)acceptsFirstResponder{
    return YES;
}

@end
