library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
port (
    input  : in std_logic;
    output : out std_logic
);
end not_gate;

architecture rtl of not_gate is
    begin
        output <= not input;
    end rtl;