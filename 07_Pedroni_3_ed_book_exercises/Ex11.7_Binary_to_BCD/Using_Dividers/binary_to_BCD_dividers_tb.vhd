-- ============================================================================================
-- Testbench: Binary to BCD with dividers method
-- ============================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity binary_to_BCD_dividers_tb is
end entity binary_to_BCD_dividers_tb ;

architecture behave of binary_to_BCD_dividers_tb is
    signal r_bin : std_logic_vector(11 downto 0);
    --
    signal w_bcd : std_logic_vector(15 downto 0);

    begin
        uut: entity work.binary_to_BCD_dividers
        port map(r_bin,w_bcd);

        process
        begin
            r_bin <= to_std_logic_vector(0,12);
            wait for 80 ns;

            r_bin <= to_std_logic_vector(1,12);
            wait for 80 ns;

            r_bin <= to_std_logic_vector(999,12);
            wait for 80 ns;

            r_bin <= to_std_logic_vector(1000,12);
            wait for 80 ns;

            r_bin <= to_std_logic_vector(4095,12);
            wait for 80 ns;

        end process;
    end architecture behave;

