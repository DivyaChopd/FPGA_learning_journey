library ieee;
use ieee.std_logic_1164.all;

entity half_subtractor is
    port(
        i_bit1 : in std_logic;
        i_bit2 : in std_logic;

        o_diff : out std_logic;
        o_borrow : out std_logic
    );
end entity half_subtractor;

    architecture rtl of half_subtractor is
        begin
            o_diff <= i_bit1 xor i_bit2;
            o_borrow <= not i_bit1 and i_bit2;
        end architecture rtl;
        
