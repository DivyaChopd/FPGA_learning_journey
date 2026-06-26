library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor is
    port(
        i_bit1 : in std_logic;
        i_bit2 : in std_logic;
        i_bit3 : in std_logic;

        o_diff : out std_logic;
        o_borrow : out std_logic
    );
end entity full_subtractor;

architecture rtl of full_subtractor is
    begin
        o_diff <= i_bit1 xor i_bit2 xor i_bit3;
        o_borrow <= (not i_bit1 and i_bit2) or (i_bit2 and i_bit3) or (i_bit3 and not i_bit1);
    end architecture rtl;