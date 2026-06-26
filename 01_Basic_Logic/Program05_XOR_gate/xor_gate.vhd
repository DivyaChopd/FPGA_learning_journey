library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
    port(
        input_1 : in std_logic;
        input_2 : in std_logic;
        xor_output : out std_logic
    );
end entity xor_gate;

architecture rtl of xor_gate is
    begin
        xor_output <= input_1 xor input_2;
    end architecture rtl;
    