Comparator 1 bit

TT:
A	B	A=B	A>B	A<B
0	0	1	0	0
0	1	0	0	1
1	0	0	1	0
1	1	1	0	0

Equation:

A=B => A xnor B
A>B => A and (not B)
A<B => (not A) and B	