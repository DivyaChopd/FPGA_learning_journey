MOD counter:

MOD - Modulus 

MOD 5 counter means there will be 5 states (0 1 2 3 4 0 1 2 3 4 0 ....)
MOD 10 counter means there will be 10 states (0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 2 ...)

For no. of bits calculation funtion is used inside a package. 
NOTES: In vivado, we need to add both ur code file and package file, then only compiler will understand the function.

Why function is used: because log base 2 is not available in math_real package hence created user defined through fucntion.