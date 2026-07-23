Exercise 11.4 Leading-ones counter

Question: Write a code that counts number of 1's before we reach to 0 from left to right.

-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTES
-----------------------------------------------------------------------------------------------------------------------------------------

1.	Use mathematical operators to find some values like to calculate no. of input bits (N) or output bits (M) – Here we knew N = 15 & wanted to calculate M . So M would be 4 
I.	N = log2 M -> here to us this u need package -> math_real
II.	Here problem is this expression only takes input as a real value and as a ouput also gives only real value. 
So conversion is needed in input side if M is integer then integer to real -> real(M) & conversion is needed on output side because we need our value as integer so again real to integer -> integer(value) 
& for conversions we need package -> numeric_std_unsigned

III.	Next problem is answer of Log2 could be in decimal point like 3.9 but we want its up rounding like up rounding of 3.9 is 4 and we need 4. So to achieve that ceil() is used.

IV.	Next problem u cannot use generic within the same interface list (here we are trying to create a dependent generic) because all generic is assigned at the same time. (so create a local generic and use it inside the architecture)

NOTE: But u can use generics in port because ports assigned after generics.

Hence to total formula is:
BITS_OUT : integer := ineger(ceil(log2(real(BITS_IN+1))));

2.	In combinational when u cannot use counter and need to check what is the previous value and update accordingly then use Array and to use array -> u need to define the array type as per ur requirement. 
type type_name is array (no of array_range) of base_type_name [no of bits in array_range];

For ex. type integr_array is array (0 to 7) of integer range 0 to 3;
    	signal internal : integr_array;
here internal is the name of array and no. of internal and no. of internals are 8 and each has 4 bits in each.

3.	Mistake –  here to represent numbers from 0 to 9 u need 4 bits. Hence BITS_IN+1 therefore the formula became: ceil(log2(real(BITS_IN+1))) 
4.	Logic used - 
Main code: 
 internal(0) <= 0;

        gen : for i in 1 to BITS_IN generate
        begin
            internal(i) <= internal(i-1) +1 
                            when (x(BITS_IN-i) ='1') and (internal(i-1)=i-1)
                            else internal (i-1);
        
ex. 101 & BITS_IN = 3

internal(0)  = 0
for i = 1
internal(1) <= internal(0) +1 
                            when (x(2) ='1') and (internal(0)=0)
                            else internal (0);
internal(1) = 1

for i = 2
	internal(2) <= internal(1) +1 
                            when (x(1) ='1') and (internal(1)=1)
                            else internal (1);
internal(2) = 1

for i = 3
internal(3) <= internal(2)+1 
                            when (x(0) ='1') and (internal(2)=2)
                            else internal (2);
internal(3) = 1
