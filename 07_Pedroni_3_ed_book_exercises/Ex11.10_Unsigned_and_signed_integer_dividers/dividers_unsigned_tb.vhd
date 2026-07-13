-- ================================================================================
-- Testbench: Unsigned and signed integer dividers
-- Description: Test is for only unsigned numbers and inputs are given in decimal
-- ================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dividers_unsigned_tb is 
end entity dividers_unsigned_tb;

architecture behave of dividers_unsigned_tb is
    constant c_BITS: natural := 4;
    signal r_A, r_B : std_logic_vector(c_BITS-1 downto 0);
    signal w_quo_uns, w_re_uns : std_logic_vector(c_BITS-1 downto 0);

    begin 
        uut: entity work.dividers
        generic map( c_BITS )
        port map( r_A, r_B,w_quo_uns,w_re_uns);

        process
        begin
            r_A <= std_logic_vector(to_unsigned(7,c_BITS));
            r_B <= std_logic_vector(to_unsigned(4,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_unsigned(7,c_BITS));
            r_B <= std_logic_vector(to_unsigned(12,c_BITS));
            wait for 80 ns;


            r_A <= std_logic_vector(to_unsigned(15,c_BITS));
            r_B <= std_logic_vector(to_unsigned(1,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_unsigned(15,c_BITS));
            r_B <= std_logic_vector(to_unsigned(15,c_BITS));
            wait for 80 ns;


            r_A <= std_logic_vector(to_unsigned(8,c_BITS));
            r_B <= std_logic_vector(to_unsigned(4,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_unsigned(8,c_BITS));
            r_B <= std_logic_vector(to_unsigned(13,c_BITS));
            wait for 80 ns;

            wait;


        end process;
    end architecture behave;