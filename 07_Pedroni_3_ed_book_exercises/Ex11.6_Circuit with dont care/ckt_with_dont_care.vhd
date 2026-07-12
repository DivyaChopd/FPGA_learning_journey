-- ===================================================================================
-- Module: Circuit with don't care outputs
-- Inputs: a(2:0)
-- Outputs: b(1:0)
-- ======================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity ckt_with_dont_care is
    port(
        a : in std_logic_vector(2 downto 0);
        --
        b : out std_logic_vector(1 downto 0)
    );
end entity ckt_with_dont_care;

architecture rtl of ckt_with_dont_care is
    begin
        with a select
            b <= "10" when "000",
                "-1" when "001",
                "11" when "010",
                "--" when "011",
                "00" when "100",
                "-1" when "101",
                "01" when "110",
                "0-" when "111",
                "00" when others;

    end architecture rtl;
    
