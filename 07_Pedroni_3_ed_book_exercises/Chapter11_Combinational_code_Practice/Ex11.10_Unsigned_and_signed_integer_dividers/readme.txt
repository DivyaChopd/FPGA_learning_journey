Exercise 11.9 Unsigned and signed integer dividers

Question: 
c) Write a VHDL for unsigned and signed dividers with outputs as QUO_UNS, RE_UNS, QUO_SIG, RE_SIG and generic constant WIDTH
d) Give given stimuli and inputs should be in bits and show results for both dividers
e) Give given stimuli and inputs should be in decimal and 2 different TB for both dividers

given stimuli:
2 inputs a and b:

a -	0111	0111	1111	1111	1000	1000
b -	0100	1100	0001	1111	0100	1101 

NOTES:
Integer types should be used because it does not determine whether no. is positive or negative. instead use unsigned and signed and for ports use std_logic or std_logic_vector types only and package - numeric_std will be required.

when value is in decimal : to_unsigned or to_signed
when value is in binary : unsigned or signed

You cannot directly use / or rem with std_logic_vector because compiler don't know whether its a +ve or -ve number. So u have to mention unsigned or signed.



