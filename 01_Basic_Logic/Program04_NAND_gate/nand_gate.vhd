library ieee;
use ieee.std_logic_1164.all;

entity nand_gate is
    port(
        input_1 : in std_logic;
        input_2 : in std_logic;
        nand_output  : out std_logic
    );
end entity nand_gate;

architecture rtl of nand_gate is
    begin
        nand_output <= input_1 nand input_2;
    end architecture rtl;