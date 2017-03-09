//
//  main.c
//  poker
//
//  Created by Raven－z on 2017/3/9.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

#define NUM_RANKS 13
#define NUM_SUITS 4
#define NUM_CARDS 5
#define TRUE 1
#define FALSE 0

typedef int Bool;

int num_in_rank[NUM_RANKS];
int num_in_suit[NUM_SUITS];
Bool straight, flush, four, three;
int pairs;

void read_cards(void);
void analyze_hand(void);
void print_result(void);

int main(int argc, const char * argv[]) {
    for (; ; ) {
        read_cards();
        analyze_hand();
        print_result();
    }
    return 0;
}

void read_cards(void){
    Bool card_exists[NUM_RANKS][NUM_SUITS];
    char ch, rank_ch, suit_ch;
    int rank, suit;
    Bool bad_card = 0;
    int cards_read = 0;
    for (rank = 0; rank < NUM_RANKS; rank ++) {
        num_in_rank[rank] = 0;
        for (suit = 0; suit < NUM_SUITS; suit ++) {
            card_exists[rank][suit] = FALSE;
        }
    }
    
    for (suit = 0; suit < NUM_SUITS; suit ++) {
        num_in_suit[suit] = 0;
    }
    
    while (cards_read < NUM_CARDS) {
        bad_card = FALSE;
        
        printf("Enter a card:");
        
        rank_ch = getchar();
        switch (rank_ch) {
            case '0':
                exit(EXIT_SUCCESS);
            case '2':
                rank = 0;
                break;
            case '3':
                rank = 1;
                break;
            case '4':
                rank = 2;
                break;
            case '5':
                rank = 3;
                break;
            case '6':
                rank = 4;
                break;
            case '7':
                rank = 5;
                break;
            case '8':
                rank = 6;
                break;
            case '9':
                rank = 7;
                break;
            case 't': case 'T':
                rank = 8;
                break;
            case 'j': case 'J':
                rank = 9;
                break;
            case 'q': case 'Q':
                rank = 10;
                break;
            case 'k': case 'K':
                rank = 11;
                break;
            case 'a': case 'A':
                rank = 12;
                break;
                
            default: bad_card = TRUE;
                break;
        }
        suit_ch = getchar();
        switch (suit_ch) {
            case 'c': case 'C':
                suit = 0;
                break;
            case 'd': case 'D':
                suit = 1;
                break;
            case 'h': case'H':
                suit = 2;
                break;
            case 's': case 'S':
                suit = 3;
                break;
            default:
                bad_card = TRUE;
                break;
        }
        
        while ((ch = getchar()) != '\n') {
            if (ch != ' ') {
                bad_card = TRUE;
            }
        }
        
        if (bad_card) {
            printf("Bad card; ignored.\n");
        }else if (card_exists[rank][suit]){
            printf("Duplicate card; ignored.\n");
        }else{
            num_in_rank[rank]++;
            num_in_suit[suit]++;
            card_exists[rank][suit] = TRUE;
            cards_read++;
        }
    }
}

void analyze_hand(void){
    int num_consec = 0;
    int rank, suit;
    straight = FALSE;
    flush = FALSE;
    four = FALSE;
    three = FALSE;
    pairs = 0;
    
    for (suit = 0; suit < NUM_SUITS; suit ++) {
        if (num_in_suit[suit] == NUM_CARDS) {
            flush = TRUE;
        }
    }
    
    rank = 0;
    while (num_in_rank[rank] == 0) {
        rank ++;
    }
    for (; rank < NUM_RANKS && num_in_rank[rank]; rank ++) {
        num_consec++;
    }
    if (num_consec == NUM_CARDS) {
        straight = TRUE;
        return;
    }
    
    for (rank = 0; rank < NUM_RANKS; rank ++) {
        if (num_in_rank[rank] == 4) {
            four = TRUE;
        }
        if (num_in_rank[rank] == 3) {
            three = TRUE;
        }
        if (num_in_rank[rank] == 2) {
            pairs++;
        }
    }
}

void print_result(void){
    if (straight && flush) {
        printf("Straight flush\n\n");
    }else if (four){
        printf("four\n\n");
    }else if (three && pairs == 1){
        printf("Full house\n\n");
    }else if (flush){
        printf("Flush\n\n");
    }else if (straight){
        printf("Straight\n\n");
    }else if (three){
        printf("Three of a kind\n\n");
    }else if (pairs == 2){
        printf("Pair\n\n");
    }else{
        printf("High card\n\n");
    }
}