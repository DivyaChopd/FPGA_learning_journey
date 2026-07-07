-- =======================================================
-- Testbench: D latch
-- =======================================================

library ieee;
use ieee.std_logic_1164.all;

entity d_latch_tb is 
end entity d_latch_tb;

architecture behave of d_latch_tb is
    signal r_data_in : std_logic :='0';
    signal r_enable : std_logic := '0';
    --
    signal w_data_out : std_logic;

    begin
        uut : entity work.d_latch
        port map(
            i_data_in => r_data_in,
            i_enable  => r_enable,
            --
            o_data_out => w_data_out
        );

        process is
            begin
		r_enable <= '0';
                r_data_in <= '0';
                wait for 20 ns;

                r_enable <= '1';
                r_data_in <= '1';
                wait for 20 ns;
		
		        r_enable <= '0';
                r_data_in <= '0';
                wait for 20 ns;

                r_enable <= '1';
                r_data_in <= '0';
                wait for 20 ns;

                r_enable <= '0';
                r_data_in <= '1';
                wait for 20 ns;

            end process;
        end architecture behave;



