library ieee;
use ieee.std_logic_1164.all;

entity XNOR_gate is
    port(
        i_bit1 : in std_logic;
        i_bit2 : in std_logic;

        o_result : out std_logic
    );
end entity XNOR_gate;

architecture rtl of XNOR_gate is
    begin
        o_result <= i_bit1 xnor i_bit2;
    end architecture rtl;
    