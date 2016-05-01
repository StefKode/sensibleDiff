#include<iostream>

/* this is a comment which should be
 * ignored in comparision (#1)
 */

int a;

int main(int argc, char *argv[])
{
    int b;

    a = b;
    // this (#2) comment should be ignored as well
    b = 1; // this should also be ignored
    b = 2;
    for (int k=0; k<b /* this #3 is another one */; k++) {
        a++;
    }
    return 0;
}
