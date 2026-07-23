-- =================================================================================
-- Testbench: Signal generator for process 1
-- =================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity signal_generator_p1_tb is
end entity signal_generator_p1_tb;

architecture behave of signal_generator_p1_tb is
    constant A : natural := 3;
    constant B : natural := 1;
    constant C : natural := 3;
    signal clk : std_logic := '1';
    signal wave1,wave2 : std_logic;
    begin
        uut: entity work.signal_generator_p1
        generic map(A,B,C)
        port map(clk,wave1,wave2);

        p_clk: process 
        begin
            wait for 20 ns;
            clk <= not clk;
        end process p_clk;

    end architecture behave;
            

