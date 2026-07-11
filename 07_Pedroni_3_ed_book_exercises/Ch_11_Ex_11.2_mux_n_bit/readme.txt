Exercise 11.2 Multiplexer

Question: Implement generic mux using only predefined types. Enter NUM_INPUTS and NUM_BITS are generic constants.

Solution: 
For Ex.  NUM_INPUTS = 8 and NUM_BITS = 4

Created a input with full data so 8*4 = 32 bits of 1 input and then input is sliced to 4 bits
created a select line from natural 
Formula: output = input (select)

Slicing of input:
input(0): 3 downto 0
input(1): 7 downto 4
input(2): 11 downto 8
input(3): 15 downto 12
input(4): 19 downto 16
input(5): 23 downto 20
input(6): 27 downto 24
input(7): 31 downto 28

from sliced input, investigate the upper and lower limit (used in formula)

lower: select *4 => select* NUM_BITS.
upper: lower + 3 => lower + (NUM_BITS-1) 
		 => select* NUM_BITS + (NUM_BITS-1) 
		 => (select +1)*NUM_BITS -1

hence : o_data_out <= i_data_in ((i_sel+1)*NUM_BITS-1 downto i_sel*NUM_BITS);


