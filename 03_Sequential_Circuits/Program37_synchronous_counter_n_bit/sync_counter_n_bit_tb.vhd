-- ======================================================================
-- Module: n-bit synchronous counter with is_max flag
-- Inputs: 1 -> clk
-- Outputs: 2 -> count, is_max
-- Constant: 2 -> BITS
-- =======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity sync_counter_n_bit_tb is
end entity sync_counter_n_bit_tb;

architecture behave of sync_counter_n_bit_tb is
    constant c_WIDTH : natural := 3 ;
    signal CLK: std_logic := '0';
    signal COUNT: std_logic_vector(c_WIDTH-1 downto 0);
    signal IS_MAX : std_logic;

    begin
        uut: entity work.sync_counter_n_bit
        generic map (c_WIDTH)
        port map(CLK,COUNT,IS_MAX);

        p_clk: process
        begin
        wait for 20 ns;
        CLK <= not CLK;
    end process p_clk;


end architecture behave;