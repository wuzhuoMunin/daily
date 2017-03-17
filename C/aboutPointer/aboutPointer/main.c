//
//  main.c
//  aboutPointer
//
//  Created by Raven－z on 2017/3/15.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#include <stdio.h>

#define N 10

void max_min(int a[], int n, int *max, int *min);
void swap (int *p, int *q);
void find_two_largest(int a[], int n, int *largest, int *second_largest);

int main(int argc, const char * argv[]) {
//    int *p,i;
//    p = &i;
//    i = 20;
//    printf("p = %d\n",*p);
    
    
//    int b[N], i, big, small;
//    printf("Enter %d number: ",N);
//    for (int i = 0; i < 10; i ++) {
//        scanf("%d", &b[i]);
//    }
//    
//    max_min(b, N, &big, &small);
//    
//    printf("Largest: %d\n", big);
//    printf("Smallest: %d\n", small);
    
//    int i,j;
//    i = 5;
//    j = 6;
//    swap(&i, &j);
//    printf("%d,%d",i,j);
    
    int largest,second_largest;
    int b[10] = {22222,31,54,623,12,35,6666,843,234,12};
    
    find_two_largest(b, 10, &largest, &second_largest);
    
    printf("%d,%d",largest,second_largest);
    
    return 0;
}

void find_two_largest(int a[], int n, int *largest, int *second_largest){
    *largest = a[0];
    for (int i = 1; i < n; i ++) {
        if (*largest < a[i]) {
            *second_largest = *largest;
            *largest = a[i];
        }
        if (*second_largest < a[i] && a[i] != *largest) {
            *second_largest = a[i];
        }
    }
}

void swap (int *p, int *q){
    int temp;
    temp = *p;
    *p = *q;
    *q = temp;
}

void max_min(int a[], int n, int *max, int *min){
    int i;
    *max = *min = a[0];
    for (i = 1; i < n; i ++) {
        if (a[i] > *max) {
            *max = a[i];
        }else if (a[i] < *min){
            *min = a[i];
        }
    }
}
