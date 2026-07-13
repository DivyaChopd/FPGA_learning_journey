-- =======================================================================
-- Testbench: Unsigned and signed integer multiplier
-- ======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_tb is
end entity multiplier_tb;

architecture behave of multiplier_tb is
    constant c_BITS : natural := 4;
    signal r_A,r_B : std_logic_vector(c_BITS-1 downto 0);
    signal w_PROD_UNS, w_PROD_SIG : std_logic_vector((2*c_BITS)-1 downto 0);

    begin
        uut: entity work.multiplier
        generic map(c_BITS)
        port map(r_A,r_B,w_PROD_UNS, w_PROD_SIG);

        process 
        begin
            r_A <= "0111";
            r_B <= "1000";
            wait for 80 ns;

            r_A <= "0111";
            r_B <= "0110";
            wait for 80 ns;

            r_A <= "1000";
            r_B <= "1000";
            wait for 80 ns;

            r_A <= "1000";
            r_B <= "1111";
            wait for 80 ns;

            r_A <= "1000";
            r_B <= "0111";
            wait for 80 ns;

            wait;
        end process;
    end architecture behave;


