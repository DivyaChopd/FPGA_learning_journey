library ieee;
use ieee.std_logic_1164.all;

entity MUX_2_to_1 is
    port(
        i_data1 : in std_logic;
        i_data2 : in std_logic;
        i_select : in std_logic;

        o_result : out std_logic
    );
end entity MUX_2_to_1;

architecture rtl of MUX_2_to_1 is
begin

    o_result <= i_data1 when i_Select = '0' else i_data2;
end architecture rtl;

