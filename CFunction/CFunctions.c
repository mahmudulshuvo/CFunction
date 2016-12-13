//
//  CFunctions.c
//  CFunction
//
//  Created by Shuvo on 12/10/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

#include "CFunctions.h"



struct Pointer {
    int x;
    int y;
};

struct Pointer *create_pointer() {
    struct Pointer *p = malloc(sizeof(struct Pointer));
    if (p) {
        p->x = 20;
        p->y = 20;
    }
    return p;
}

void delete_pointer(struct Pointer *p) {
    free(p);
}

int pointer_x(struct Pointer *p) {
    return p->x;
}

int pointer_y(struct Pointer *p) {
    return p->y;
}

void workWithIntPtr( int32_t * p)
{
    printf("The 1st 2 elements of the array are %d\n and %d\n", p[0], p[1]);
    p[2] = 555;
    p[3] = 666;
    p[4] = 777;
}
