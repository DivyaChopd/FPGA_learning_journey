-- ===================================================================================
-- Testbench: Circuit with don't care outputs
-- ======================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity ckt_with_dont_care_tb is
end entity ckt_with_dont_care_tb;

architecture behave of ckt_with_dont_care_tb is
    signal r_A : std_logic_vector(2 downto 0);
    --
    signal w_B : std_logic_vector(1 downto 0);

    begin
        uut: entity work.ckt_with_dont_care
        port map(r_A,w_B);

        process
        begin
            for i in 0 to 7 loop
            r_A <= to_std_logic_vector(i,3);
            wait for 20 ns;
            end loop;
        end process;
    end architecture behave;

