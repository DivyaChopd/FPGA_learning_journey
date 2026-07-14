-- ====================================================================================
-- Testbench: Division of integers with rounding
-- ====================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity division_with_round_tb is
end entity division_with_round_tb;

architecture behave of division_with_round_tb is
    constant c_BITS : natural := 8;
    signal r_A , r_B : std_logic_vector(c_BITS-1 downto 0);
    signal w_QUO : std_logic_vector(c_BITS-1 downto 0);

    begin
        uut: entity work.division_with_round
        generic map(c_BITS)
        port map(r_A,r_B,w_QUO);

    process
    begin
        r_A <= "11110111";
        r_B <= "01001100";
        wait for 80 ns;

        r_A <= "11111111";
        r_B <= "00011111";
        wait for 80 ns;

        r_A <= "11111000";
        r_B <= "01001101";
        wait for 80 ns;
        wait;
    end process;
end architecture behave;




