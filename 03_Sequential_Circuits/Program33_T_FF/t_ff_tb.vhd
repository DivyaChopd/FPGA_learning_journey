-- =========================================================
-- Testbench: T Flip Flop
-- =========================================================

library ieee;
use ieee.std_logic_1164.all;

entity t_ff_tb is
end entity t_ff_tb;

architecture behave of t_ff_tb is
    signal r_t : std_logic := '0';
    signal r_clk: std_logic := '0';
    --
    signal w_q: std_logic;

    begin
        uut: entity work.t_ff
        port map(
            i_t => r_t,
            i_clk => r_clk,
            --
            o_q => w_q
        );

        process is
            begin
                r_clk <= '0';
                r_t <= '0';
                wait for 20 ns;

                r_clk <= '1';
                r_t <= '0';
                wait for 20 ns;

                r_clk <= '0';
                r_t <= '1';
                wait for 20 ns;

                r_clk <= '1';
                r_t <= '1';
                wait for 20 ns;

            end process;
        end architecture behave;


