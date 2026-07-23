-- =====================================================================
-- Module: Signal generator for process 2
-- Inputs: 1 -> clk
-- Outputs: 2 -> wave1, wave2
-- Constants: 3 -> A,B,C
-- =====================================================================

library ieee;
use ieee.std_logic_1164.all;

entity signal_generator_p2 is
    generic(
        A : natural :=3;
        B : natural :=1;
        C : natural :=3
    );
    port(
        clk : in std_logic;
        wave1,wave2: out std_logic
    );
end entity signal_generator_p2 ;

architecture rtl of signal_generator_p2 is
    signal i : integer range 0 to A+B+C;
    begin
    
        process
        begin
        wait until clk = '1';
            i <= i+1;
        if i = A then
            wave1 <= '1';
        elsif i = A+B then
            wave2 <= '1';
        elsif i = A+B+c then
            wave1 <= '0';
            wave1 <= '0';
            i <= 0;
        end if;

    end process;
    end architecture rtl;

