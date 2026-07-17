-- ======================================================================
-- Module: 4-bit Asynchronous counter or ripple counter
-- =======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity asynchronous_counter_tb is
end entity asynchronous_counter_tb;

architecture behave of asynchronous_counter_tb is
    signal CLK: std_logic := '0';
    signal COUNT : std_logic_vector(3 downto 0);

    begin
        uut: entity work.asynchronous_counter
        port map(CLK,COUNT);

        p_clk: process
        begin
        wait for 20 ns;
        CLK <= not CLK;
    end process p_clk;


end architecture behave;