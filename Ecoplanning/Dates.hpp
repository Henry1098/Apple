//
//  Dates.hpp
//  Ecoplanning
//
//  Created by Henry NZINGA on 26/07/2017.
//  Copyright © 2017 Henry NZINGA. All rights reserved.
//

#ifndef Dates_hpp
#define Dates_hpp

#include <stdio.h>
#include <ctime>

class Dates
{
public:
    time_t calculdates(time_t date, int jours);
    int retourweekday(time_t dates);
    double differencedates(time_t date1,time_t date2);
    time_t retirerdates(time_t date, int jours);
};



#endif /* Dates_hpp */
