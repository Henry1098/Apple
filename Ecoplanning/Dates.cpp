//
//  Dates.cpp
//  Ecoplanning
//
//  Created by Henry NZINGA on 26/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#include "Dates.hpp"
#include <math.h>

time_t Dates::calculdates(time_t date, int jours)
{
    time_t fin = 0;
    int restmp = floor(jours/5);
    int rest = (jours - (restmp * 5));
    int qrest = (7*restmp)+(rest-1);
   struct tm * datum = localtime(&date);
    datum->tm_mday += qrest;
    char buffer[80];
    strftime(buffer, 80, "%e/%m/%y",datum);
    fin = mktime(datum);

    if(jours< 5)
    {
        switch (jours) {
            case 1:
                return date;
                break;
            case 2:
                datum->tm_mday+=1;
                if(datum->tm_wday ==6)
                {
                    datum->tm_mday+=2;
                    strftime(buffer, 80, "%e/%m/%y",datum);
                    fin = mktime(datum);
                }else{
                    datum->tm_mday+=1;
                    strftime(buffer, 80, "%e/%m/%y",datum);
                    fin = mktime(datum);
                    
                }
                break;
            case 3:
                datum->tm_mday+=1;
                if(datum->tm_wday ==6)
                {
                    datum->tm_mday+=4;
                    strftime(buffer, 80, "%e/%m/%y",datum);
                    fin = mktime(datum);
                }
                if(datum->tm_wday == 5)
                {
                    datum->tm_mday+=5;
                    strftime(buffer, 80, "%e/%m/%y",datum);
                    fin = mktime(datum);
                }
                else{
                    datum->tm_mday+=2;
                    strftime(buffer, 80, "%e/%m/%y",datum);
                    fin = mktime(datum);
                    
                }
        
                break;
                
            case 4:
                datum->tm_mday+=1;
                
                if(datum->tm_wday ==6)
                {
                    datum->tm_mday+=5;
                    strftime(buffer, 80, "%e/%m/%y",datum);
                    fin = mktime(datum);
                }
                if(datum->tm_wday == 5)
                {
                    datum->tm_mday+=6;
                    strftime(buffer, 80, "%e/%m/%y",datum);
                    fin = mktime(datum);
                }
                else{
                    datum->tm_mday+=3;
                    strftime(buffer, 80, "%e/%m/%y",datum);
                    fin = mktime(datum);
                    
                }
                
            default:
                break;
        }
    }
    return fin;
}
