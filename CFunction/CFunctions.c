//
//  CFunctions.c
//  CFunction
//
//  Created by Shuvo on 12/10/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

#include "CFunctions.h"


void workWithIntPtr( int32_t * p)
{
    printf("The 1st 2 elements of the array are %d\n and %d\n", p[0], p[1]);
    p[2] = 555;
    p[3] = 666;
    p[4] = 777;
}
