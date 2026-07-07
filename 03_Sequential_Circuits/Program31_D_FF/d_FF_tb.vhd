-- ====================================================================
-- Testbench: D Flip Flop
-- ====================================================================

library ieee;
use ieee.std_logic_1164.all;

entity d_FF_tb is
end entity d_FF_tb;

architecture behave of d_FF_tb is
    signal r_data_in: std_logic := '0';
    signal r_clk: std_logic := '0';
    signal r_reset: std_logic := '0';
    --
    signal w_data_out: std_logic;

    begin
        uut: entity work.d_FF
        port map(
            i_data_in => r_data_in,
            i_clk => r_clk,
            i_reset => r_reset,
            --
            o_data_out => w_data_out
        );

        process is
            begin
     
                r_reset <= '0';
                r_clk <= '1';
                r_data_in <= '1';
                wait for 20 ns;

                r_reset <= '0';
                r_clk <= '0';
                r_data_in <= '0';
                wait for 20 ns;

                r_reset <= '1';
                r_clk <= '1';
                r_data_in <= '1';
                wait for 20 ns;

                r_reset <= '1';
                r_clk <= '0';
                r_data_in <= '1';
                wait for 20 ns;

        

            end process;
        end architecture behave;
        
                





