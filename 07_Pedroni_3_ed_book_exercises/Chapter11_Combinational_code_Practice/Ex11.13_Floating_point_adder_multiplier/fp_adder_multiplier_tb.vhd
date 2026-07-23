-- ======================================================================
-- Testbench: Floating-point adder and multiplier
-- ======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.float_pkg.all;

entity fp_adder_multiplier_tb is
end entity fp_adder_multiplier_tb;

architecture behave of fp_adder_multiplier_tb is
    signal r_A, r_B :std_logic_vector(8 downto 0);
    signal w_SUM, w_PROD : std_logic_vector(8 downto 0);

    begin
        uut: entity work.fp_adder_multiplier
        port map(r_A,r_B,w_SUM,w_PROD);

        process 
        begin
            r_A <= "011100010";
            r_B <= "011101001";
            wait for 160 ns;

            r_A <= "011100010";
            r_B <= "011101100";
            wait for 160 ns;

            r_A <= "011100010";
            r_B <= "011101110";
            wait for 160 ns;
            wait;
        end process;
    end architecture behave;
