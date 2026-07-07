-- ===================================================================
-- Testbench: JK Flip Flop
-- ===================================================================

library ieee;
use ieee.std_logic_1164.all;

entity jk_ff_tb is
end entity jk_ff_tb ;

architecture behave of jk_ff_tb is
    signal r_j : std_logic := '0';
    signal r_k : std_logic := '0';
    signal r_clk : std_logic := '0';
    --
    signal w_q : std_logic;

    begin
        uut: entity work.jk_ff
        port map(
            i_j => r_j,
            i_k => r_k,
            i_clk => r_clk,
            --
            o_q => w_q
        );

        process is
            begin
                    r_j <= '0'; 
                    r_k <= '0';
                    r_clk <= '0';
                    wait for 20 ns;

                    r_j <= '0'; 
                    r_k <= '0';
                    r_clk <= '1';
                    wait for 20 ns;

                    r_j <= '0'; 
                    r_k <= '1';
                    r_clk <= '0';
                    wait for 20 ns;

                    r_j <= '0'; 
                    r_k <= '1';
                    r_clk <= '1';
                    wait for 20 ns;

                    --
                    r_j <= '1'; 
                    r_k <= '0';
                    r_clk <= '0';
                    wait for 20 ns;

                    r_j <= '1'; 
                    r_k <= '0';
                    r_clk <= '1';
                    wait for 20 ns;

                    r_j <= '1'; 
                    r_k <= '1';
                    r_clk <= '0';
                    wait for 20 ns;

                    r_j <= '1'; 
                    r_k <= '1';
                    r_clk <= '1';
                    wait for 20 ns;

            end process;
        end architecture behave;

