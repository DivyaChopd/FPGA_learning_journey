-- ============================================================
-- Testbench: SR Latch
-- ============================================================

library ieee;
use ieee.std_logic_1164.all;

entity sr_latch_tb is
end entity sr_latch_tb;

architecture behave of sr_latch_tb is
    signal r_set : std_logic := '0';
    signal r_reset : std_logic := '0';
    --
    signal w_data_out : std_logic;
    signal w_data_out_comp : std_logic;
    
    begin
        uut: entity work.sr_latch
        port map(
            i_set => r_set,
            i_reset => r_reset,
            --
            o_data_out => w_data_out,
            o_data_out_comp => w_data_out_comp
        );

    process is
        begin
            r_set <= '1';
            r_reset <= '0';
            wait for 20 ns;

            r_set <= '0';
            r_reset <= '1';
            wait for 20 ns;

            r_set <= '1';
            r_reset <= '1';
            wait for 20 ns;

            r_set <= '0';
            r_reset <= '0';
            wait for 20 ns;

        end process;
    end architecture behave;
    

