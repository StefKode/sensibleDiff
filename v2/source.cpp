#include<iostream>

/* this is a comment which should be
 * ignored in comparision (#3)
 */

int a;
int c;

int main(int argc, char *argv[])
{
    int b;

    a = b;
    // this (#3) comment should be ignored as well
    b = 1; // this should also be ignored (huh)
    b = 2;
    for (int k=0 /* ahallo */; k<b /* this #4 is another one */; k+=1) { /*
                                                                            weired comment
                                                                            */ c++;
        a++;
    }
    return 0;
}
