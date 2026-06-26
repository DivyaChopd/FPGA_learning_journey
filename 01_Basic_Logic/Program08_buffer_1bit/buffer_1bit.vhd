library ieee;
use ieee.std_logic_1164.all;

entity buffer_1bit is
    port(
        i_bit : in std_logic;
        o_bit : out std_logic
    );
end entity buffer_1bit;

architecture rtl of buffer_1bit is
    begin
        o_bit <= i_bit;
    end architecture rtl;
    