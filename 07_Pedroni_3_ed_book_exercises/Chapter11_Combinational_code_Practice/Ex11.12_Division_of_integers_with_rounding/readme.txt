Exercise 11.12 Division of 2 integers with rounding

Question: a,b,quo are unsigned integers with WIDTH width. q must be round up / down

NOTES: for round up : round(real) and it return also real.

from			to			conversion
std_logic_vector	unsigned		unsigned(a)	
unsigned 		integer			to_integer(a)
integer			real			real(a)
real			integer			integer(a)
integer			unsigned 		to_unsigned
unsigned		std_logic_vector	std_logic_vector(a,size)		