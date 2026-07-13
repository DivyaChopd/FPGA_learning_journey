-- ================================================================================
-- Testbench: Unsigned and signed integer dividers
-- Description: Test is for only signed numbers and inputs are given in decimal
-- ================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dividers_signed_tb is 
end entity dividers_signed_tb;

architecture behave of dividers_signed_tb is
    constant c_BITS: natural := 4;
    signal r_A, r_B : std_logic_vector(c_BITS-1 downto 0);
    signal w_quo_sig, w_re_sig : std_logic_vector(c_BITS-1 downto 0);

    begin 
        uut: entity work.dividers
        generic map( c_BITS )
        port map( 
        a => r_A, 
        b => r_B,
        quo_sig => w_quo_sig,
        re_sig => w_re_sig);

        process
        begin
            r_A <= std_logic_vector(to_signed(7,c_BITS));
            r_B <= std_logic_vector(to_signed(4,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_signed(7,c_BITS));
            r_B <= std_logic_vector(to_signed(12,c_BITS));
            wait for 80 ns;


            r_A <= std_logic_vector(to_signed(15,c_BITS));
            r_B <= std_logic_vector(to_signed(1,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_signed(15,c_BITS));
            r_B <= std_logic_vector(to_signed(15,c_BITS));
            wait for 80 ns;


            r_A <= std_logic_vector(to_signed(8,c_BITS));
            r_B <= std_logic_vector(to_signed(4,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_signed(8,c_BITS));
            r_B <= std_logic_vector(to_signed(13,c_BITS));
            wait for 80 ns;

            wait;


        end process;
    end architecture behave;