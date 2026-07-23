Exercise 11.3 Address Decoder
Question: Write a code for n-bit Address Decoder with NUM_BITS (number of bits) as generic parameter. Use only concurrent statement (no process). Show result for NUM_BITS = 3.

Solution: 
Output bits calculate using arithmetic operator ** : 2** NUM_BITS : 2^3 = 8
Used generate and when statement

 output(i) <= en when input(i) else 0;
Ex. output(0) <= 1 when input(000) else 0;


For integer to std_logic_vector conversion:
input = to_std_logic_vector(i,NUM_BITS)




-------------------------------------------------------------------------------------------------------------------
-- NOTES
-------------------------------------------------------------------------------------------------------------------

1.	Use mathematical operators to find some values like to calculate no. of input bits (N) or output bits (M) or select bits (S) – Here we knew N =3 & wanted to calculate M . So M would be 8 (2^3 = 8)
M = 2^N  -> 2 **N  

2.	Use conversions to convert from int to std_logic_vector -> package name -> numeric_std_unsigned
input = to_std_logic_vector(integer parameter, No. of bits needed)
EX. a = to_std_logic_vector(i,NUM_BITS)

3.	To generate output – Remember we u mention any parameter name it means its 1 and when want to use opposite use unary operator like here only en means en = 1 and not en means en =0. So use it for output like here.
o/p(i) = en when i/p(i)

