library ieee;
use ieee.std_logic_1164.all;

entity NOR_gate is
    port(
        i_bit1 : in std_logic;
        i_bit2 : in std_logic;
        o_result : out std_logic
    );
    end;

    architecture rtl of NOR_gate is
        begin
            o_result <= i_bit1 nor i_bit2;
        end;
        