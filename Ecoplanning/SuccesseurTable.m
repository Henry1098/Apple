//
//  SuccesseurTable.m
//  Ecoplanning
//
//  Created by Henry NZINGA on 19/08/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#import "SuccesseurTable.h"
#import "Globals.h"

@implementation SuccesseurTable

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}


-(void)keyDown:(NSEvent *)event
{
    
    if([event keyCode] == 0x22 && etatProjet == true)
    {
        NSLog(@"Hello world Successeur");
        
    }
}

@end
