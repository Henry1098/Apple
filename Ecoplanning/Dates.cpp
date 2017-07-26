//
//  Dates.cpp
//  Ecoplanning
//
//  Created by Henry NZINGA on 26/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#include "Dates.hpp"

time_t Dates::calculdates(time_t date, int jours)
{
   struct tm * datum = localtime(&date);
    datum->tm_mday +=jours;
    char buffer[80];
    strftime(buffer, 80, "%e/%m/%y",datum);
    time_t fin = mktime(datum);
    
    return fin;
}
