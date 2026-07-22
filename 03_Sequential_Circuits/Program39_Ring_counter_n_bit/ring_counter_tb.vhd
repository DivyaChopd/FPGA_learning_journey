-- ====================================================================================
-- Testbench: Ring counter
-- ====================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity ring_counter_tb is
end entity ring_counter_tb ;

architecture behave of ring_counter_tb is
    constant c_WIDTH: natural := 4;
    signal r_CLK : std_logic := '0';
    signal w_COUNT : std_logic_vector(c_WIDTH-1 downto 0);

    begin
        uut: entity work.ring_counter
        generic map(c_WIDTH)
        port map(r_CLK,w_COUNT);

    p_clk:process
    begin
        wait for 20 ns;
        r_CLK <= not r_CLK;
    end process;
end architecture behave;


