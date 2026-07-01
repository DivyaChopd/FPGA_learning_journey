library ieee;
use ieee.std_logic_1164.all;

entity demux_1_to_2 is
    port(
        i_data : in std_logic;
        i_select : in std_logic;

        o_result1 : out std_logic;
        o_result2 : out std_logic
    );
end entity demux_1_to_2;

architecture rtl of demux_1_to_2 is
    begin
    o_result1 <= i_data when i_select = '0' else '0';
o_result2 <= i_data when i_select = '1' else '0';
end architecture rtl;
