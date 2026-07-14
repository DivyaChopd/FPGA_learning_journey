Exercise 11.17 : Multiple Detector

Question: Code must detect whether a signal a is a multiple of b, (a,b are unsigned integers). O/p has 2 flags - is_multiple and invalid_input.
is_multiple -- should be 1 when signal a is a multiple of b
invalid_input -- should be 1 when any of the signals are 0;
use WIDTH generic constant.

Testbench values:
a	b	is_multiple	invalid_input
31	3	0		0
0	3	0		1
19	0	0		1
12	3	1		0
14	3	0		0

NOTES:
First take care of condition when dividend or divisor is 0 because in maths when divisor is 0 solution is undefined so if u don't take care of it. It will produce fatal error. 

