-- ===================================================================
-- Testbench: Largest cluster of ones
-- ===================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;
use ieee.numeric_std_unsigned.all;

entity largest_cluster_of_1s_tb is
end entity largest_cluster_of_1s_tb; 

architecture behave of largest_cluster_of_1s_tb is
    constant c_BITS_IN : natural := 8;
    --
    signal r_x : std_logic_vector(c_BITS_IN-1 downto 0);
    --
    signal w_y : std_logic_vector( integer(ceil(log2(real(c_BITS_IN+1))))-1 downto 0);

    begin
        uut: entity work.largest_cluster_of_1s
        generic map(c_BITS_IN)
        port map(r_x,w_y);

    process
    begin
        r_x <= "01110011";
        wait for 80 ns;

         r_x <= "10100000";
        wait for 80 ns;

         r_x <= "11111101";
        wait for 80 ns;

         r_x <= "11111111";
        wait for 80 ns;

        wait;
    end process;
end architecture behave;

