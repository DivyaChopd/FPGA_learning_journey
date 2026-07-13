Exercise 11.9 Unsigned and signed integer multiplier

Question: 
c) Write a VHDL for unsigned and signed multiplier with outputs as PROD_UNS and PROD_SIG and generic constant WIDTH
d) Give given stimuli and inputs should be in bits and show results for both multiplier
e) Give given stimuli and inputs should be in decimal and 2 different TB for both multipliers

given stimuli:
2 inputs a and b:

a - 0111	0111	1000	1000	1000
b - 1000	0110	1000	1111	0111

NOTES:
Integer types should be used because it does not determine whether no. is positive or negative. instead use unsigned and signed and for ports use std_logic or std_logic_vector types only and package - numeric_std will be required.

when value is in decimal : to_unsigned or to_signed
when value is in binary : unsigned or signed

You cannot directly use * with std_logic_vector because compiler don't know whether its a +ve or -ve number. So u have to mention unsigned or signed.

