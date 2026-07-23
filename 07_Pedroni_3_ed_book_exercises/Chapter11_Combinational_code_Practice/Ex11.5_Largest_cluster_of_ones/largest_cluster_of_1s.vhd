-- =======================================================================================
-- Module: Largest cluster of ones
-- Inputs: 1 -> x
-- Ouputs: 1 -> y
-- Constants: 2 -> N - BITS_IN (No. of input bits), M - BITS_OUT (No. of output bits)
-- Rules: M is a depenedent constant
-- ========================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std_unsigned.all;

entity largest_cluster_of_1s is
    generic(
        BITS_IN : natural := 8
    );
    port(
        x : in std_logic_vector(BITS_IN-1 downto 0);
        y : out std_logic_vector( integer(ceil(log2(real(BITS_IN+1))))-1 downto 0)
    );
end entity largest_cluster_of_1s;

architecture rtl of largest_cluster_of_1s is
    constant BITS_OUT : integer := integer(ceil(log2(real(BITS_IN+1))));

    type integr_array is array (0 to BITS_IN) of integer range 0 to BITS_IN;
    signal current : integr_array;
    signal max : integr_array;

    begin
        current(0) <= 0;
        max(0) <= 0;

        gen : for i in 1 to BITS_IN generate
        begin
        current(i) <= current(i-1) +1 when x(BITS_IN-i) = '1' else
                        0;
        
        max(i) <= current(i) when current(i) > max(i-1) else 
                    max(i-1);

        end generate;

       y <= to_std_logic_vector(max(BITS_IN),BITS_OUT);
    end architecture rtl;