-- ====================================================================================
-- Testbench: Johnson counter
-- ====================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity johnson_counter_tb is
end entity johnson_counter_tb ;

architecture behave of johnson_counter_tb is
    constant c_WIDTH: natural := 4;
    signal r_CLK : std_logic := '0';
    signal r_CLR : std_logic := '1';
    signal w_COUNT : std_logic_vector(c_WIDTH-1 downto 0);

    begin
        uut: entity work.johnson_counter
        generic map(c_WIDTH)
        port map(r_CLK,r_CLR,w_COUNT);

    p_clk:process
    begin
        wait for 20 ns;
        r_CLK <= not r_CLK;
    end process;

    p_clr: process
    begin
        wait for 60 ns;
        r_CLR <= '0';
        wait;
    end process;

end architecture behave;


