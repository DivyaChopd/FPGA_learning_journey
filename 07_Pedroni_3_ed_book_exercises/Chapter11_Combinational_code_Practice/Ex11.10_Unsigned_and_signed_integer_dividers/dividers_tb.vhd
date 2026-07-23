-- ================================================================================
-- Testbench: Unsigned and signed integer dividers
-- ================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dividers_tb is 
end entity dividers_tb;

architecture behave of dividers_tb is
    constant c_BITS: natural := 4;
    signal r_A, r_B : std_logic_vector(c_BITS-1 downto 0);
    signal w_quo_uns, w_re_uns,w_quo_sig, w_re_sig : std_logic_vector(c_BITS-1 downto 0);

    begin 
        uut: entity work.dividers
        generic map( c_BITS )
        port map( r_A, r_B,w_quo_uns,w_re_uns,w_quo_sig,w_re_sig);

        process
        begin
            r_A <= "0111";
            r_B <= "0100";
            wait for 80 ns;

            r_A <= "0111";
            r_B <= "1100";
            wait for 80 ns;


            r_A <= "1111";
            r_B <= "0001";
            wait for 80 ns;

            r_A <= "1111";
            r_B <= "1111";
            wait for 80 ns;


            r_A <= "1000";
            r_B <= "0100";
            wait for 80 ns;

            r_A <= "1000";
            r_B <= "1101";
            wait for 80 ns;
            wait;


        end process;
    end architecture behave;