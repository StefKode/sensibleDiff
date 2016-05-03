void helper(int *something)
{
    for (int i = 0; i<maxi; i++) {
        // one  comment
        for (int k=0; k<maxk; k++) {
            int bla = somethin[i*maxk /* something important here*/ maxk]; //oops nothing here
            donothing(++bla);
        }
}
