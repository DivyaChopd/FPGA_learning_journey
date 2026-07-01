-- =====================================================================================================
-- Module: Comparator 4-bit
-- Inputs: i_data1(3:0), i_data2(3:0)
-- Outputs: o_equal , o_greater_than (i_input1 > i_input2), o_less_than (i_input1 < i_input2)
-- =====================================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity comparator_4bit is
    port(
        i_data1 : in std_logic_vector(3 downto 0);
        i_data2 : in std_logic_vector(3 downto 0);

        o_equal : out std_logic;
        o_greater_than : out std_logic;
        o_less_than : out std_logic
    );
end entity comparator_4bit;

architecture rtl of comparator_4bit is
        begin
            p_comparator_4bit : process(i_data1,i_data2) is
                begin  
                if i_data1 = i_data2 then o_equal <= '1'; o_greater_than <='0' ; o_less_than <= '0';
                elsif i_data1 > i_data2 then o_equal <= '0'; o_greater_than <='1' ; o_less_than <= '0';
                else o_equal <= '0'; o_greater_than <='0' ; o_less_than <= '1';
                end if;
            end process;
            
end architecture rtl;

