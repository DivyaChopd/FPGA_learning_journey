-- =======================================================================================
-- Module: Leading-ones counter
-- Inputs: 1 -> x
-- Ouputs: 1 -> y
-- Constants: 2 -> N - BITS_IN (No. of input bits), M - BITS_OUT (No. of input bits)
-- Rules: M is a depenedent constant
-- ========================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std_unsigned.all;

entity leading_1_counter is
    generic(
        BITS_IN : natural := 8
    );
    port(
        x : in std_logic_vector(BITS_IN-1 downto 0);
        y : out std_logic_vector( integer(ceil(log2(real(BITS_IN+1))))-1 downto 0)
    );
end entity leading_1_counter;

architecture rtl of leading_1_counter is
    constant BITS_OUT : integer := integer(ceil(log2(real(BITS_IN+1))));

    type integr_array is array (0 to BITS_IN) of integer range 0 to BITS_IN;
    signal internal : integr_array;
    begin
        internal(0) <= 0;

        gen : for i in 1 to BITS_IN generate
        begin
            internal(i) <= internal(i-1) +1 
                            when (x(BITS_IN-i) ='1') and (internal(i-1)=i-1)
                            else internal (i-1);
        end generate;

        y <= to_std_logic_vector(internal(BITS_IN),BITS_OUT);
    end architecture rtl;
