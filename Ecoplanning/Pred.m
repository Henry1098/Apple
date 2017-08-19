//
//  Pred.m
//  Ecoplanning
// Gestion de la Table du Predecesseur
//  Created by Henry NZINGA on 19/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "Pred.h"
#import "Globals.h"
@implementation Pred

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


-(void)keyDown:(NSEvent *)event
{
   
    if([event keyCode] == 0x22 && etatProjet == true)
    {
        NSLog(@"Hello world Predecesseur");
        
    }
}

@end
