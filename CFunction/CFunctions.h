//
//  CFunctions.h
//  CFunction
//
//  Created by Shuvo on 12/10/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

#ifndef CFunctions_h
#define CFunctions_h

#include <stdio.h>
#include <stdlib.h>

#endif /* CFunctions_h */
typedef struct Pointer Pointer;
Pointer *create_pointer();
void delete_pointer(Pointer *p);
int pointer_x(Pointer *p);
int pointer_y(Pointer *p);
void workWithIntPtr( int32_t * p);
