-- =====================================================================================================
-- Module: Comparator 1-bit
-- Inputs: i_data1 and i_data2
-- Outputs: o_equal, o_data1_greater, o_data2_greater
-- =====================================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity comparator_1bit is
    port(
        i_data1 : in std_logic;
        i_data2 : in std_logic;

        o_equal : out std_logic;
        o_data1_greater : out std_logic;
        o_data2_greater : out std_logic
    );
end entity comparator_1bit;

architecture rtl of comparator_1bit is
    begin
        p_comparator_1bit : process(i_data1, i_data2) is
            begin
                if i_data1 = i_data2 then o_equal <= '1'; o_data1_greater <='0'; o_data2_greater <='0';
                    elsif i_data1 > i_data2 then o_equal <= '0'; o_data1_greater <='1'; o_data2_greater <='0';
                    else o_equal <= '0'; o_data1_greater <='0'; o_data2_greater <='1';
                end if;
        end process;
end architecture rtl;