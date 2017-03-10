//
//  main.c
//  poker
//
//  Created by Raven－z on 2017/3/9.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

#define NUM_CARDS 5
#define TRUE 1
#define FALSE 0

typedef int Bool;

char card_in_hands[NUM_CARDS][2];
Bool straight, flush, four, three,full_house;
int pairs;

void print_result(void);

void new_function_read_card(void);
void new_analyze_hand(char cards[NUM_CARDS][2]);

int main(int argc, const char * argv[]) {
    for (;;) {
    new_function_read_card();
    new_analyze_hand(card_in_hands);
    print_result();
    }

    return 0;
}

Bool rankIsInArray(char str){
    Bool contain = 0;
    char array[] = {'2','3','4','5','6','7','8','9','t','j','q','k','a','T','J','Q','K','A',};
    
    for (int i = 0; i < sizeof(array); i ++) {
        if (str == array[i]) {
            contain = TRUE;
        }
    }
    return contain;
}

Bool suitIsInArray(char str){
    Bool contain = 0;
    char array[] = {'c','d','h','s','C','D','H','S'};
    
    for (int i = 0; i < sizeof(array); i ++) {
        if (str == array[i]) {
            contain = TRUE;
        }
    }
    return contain;
}

void new_function_read_card(){
    Bool bad_card = 0;
    int card_count = 0;
    Bool duplicate = 0;
    
    while (card_count < NUM_CARDS) {
        bad_card = FALSE;
        duplicate = FALSE;
        
        printf("Enter a card:");
    
        char number = getchar();
        char suit = getchar();
        if (rankIsInArray(number) && suitIsInArray(suit)) {
            card_in_hands[card_count][0] = number;
            card_in_hands[card_count][1] = suit;
        }else{
            bad_card = TRUE;
        }
        
        char ch;
        while ((ch = getchar()) != '\n') {
            if (ch == ' ') {
                bad_card = TRUE;
            }
        }
        
        for (int i = 0; i < card_count; i ++) {
            if ((card_in_hands[i][0] == card_in_hands[card_count][0]) && (card_in_hands[i][1] == card_in_hands[card_count][1])) {
                duplicate = TRUE;
            }
        }
        
        if (bad_card) {
            printf("Bad card; ignored.\n");
        }else if(duplicate){
            printf("Duplicate card; ignored.\n");
        }else{
            card_count ++;
        }
    }
}

Bool allEqual(char a,char b,char c, char d,char f){
    return ((a == b) && (a == c) && (a == d) && (a == f)) ? TRUE : FALSE;
}

int changeChar(char a){
    if (( a == 't') || ( a == 'T')) {
        return 10;
    }else if (( a == 'j') || ( a == 'J')){
        return 11;
    }else if (( a == 'q') || ( a == 'Q')){
        return 12;
    }else if (( a == 'k') || ( a == 'K')){
        return 13;
    }else if (( a == 'a') || ( a == 'A')){
        return 1;
    }else{
        return (int)(a-48);
    }
}

void new_analyze_hand(char cards[NUM_CARDS][2]){
    straight = FALSE;
    flush = FALSE;
    four = FALSE;
    three = FALSE;
    full_house = FALSE;
    pairs = 0;
    
    if (allEqual(cards[0][1],cards[1][1],cards[2][1],cards[3][1],cards[4][1])) {
        flush = TRUE;
    }
    
    int count = 0;
    for (int i = 0; i < NUM_CARDS; i ++) {
        for (int j = 0; j < NUM_CARDS; j ++) {
            if (i != j) {
                if (cards[i][0] == cards[j][0]) {
                    count ++;
                }
            }
        }
    }
    
    if (count == 2) {
        pairs = 1;
    }else if (count == 4){
        pairs = 2;
    }else if (count == 6){
        three = TRUE;
    }else if (count == 12){
        four = TRUE;
    }else if (count == 8){
        full_house = TRUE;
    }

    int cardNumber[NUM_CARDS];
    int addNumber = 0;
    for (int i = 0; i < NUM_CARDS; i ++) {
        cardNumber[i] = changeChar(cards[i][0]);
        addNumber += cardNumber[i];
    }
    
    for (int i = 0; i < sizeof(cardNumber); i ++) {
        if (cardNumber[i] != 0) {
            if ((addNumber/cardNumber[i]) == NUM_CARDS) {
                straight = TRUE;
            }
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
