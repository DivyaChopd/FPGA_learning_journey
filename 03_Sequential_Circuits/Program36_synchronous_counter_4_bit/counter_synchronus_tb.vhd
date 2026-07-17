-- ================================================================================
-- Testbench: Synchronous Counter 4-bit
-- ================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_sync_tb is
end entity counter_sync_tb;

architecture behave of  counter_sync_tb is
    signal r_CLK, r_RST : std_logic := '0';
    signal w_DOUT : std_logic_vector(3 downto 0);

    begin
        uut: entity work.counter_sync
        port map(r_CLK,r_RST,w_DOUT);

    p_clk: process
    begin
        wait for 20 ns;
        r_CLK <= not r_CLK;
    end process p_clk;

    p_rst: process
    begin
        wait for 20 ns;
        r_RST <= '1';
        wait for 20 ns;
        r_RST <= '0';
        wait;
    end process p_rst;

end architecture behave;


