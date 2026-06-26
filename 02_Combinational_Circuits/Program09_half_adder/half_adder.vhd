library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port(
        input_1 : in std_logic;
        input_2 : in std_logic;
        sum : out std_logic;
        carry : out std_logic
    );
end entity half_adder;

architecture rtl of half_adder is
    begin
        sum <= input_1 xor input_2;
        carry <= input_1 and input_2;
    end architecture rtl;
    