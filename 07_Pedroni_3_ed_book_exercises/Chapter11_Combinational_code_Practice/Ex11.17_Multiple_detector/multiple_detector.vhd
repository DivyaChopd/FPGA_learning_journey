-- ==================================================================================
-- Module: Multiple detector
-- Inputs: 2 -> a,b
-- Outputs: 2 -> is_multiple , invalid_input
-- Constants: 1 -> c_WIDTH
-- =================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiple_detector is
    generic(
        c_WIDTH : natural
    );
    port(
        a,b: in std_logic_vector(c_WIDTH-1 downto 0);
        is_multiple,invalid_input: out std_logic
    );
end entity multiple_detector;

architecture rtl of multiple_detector is
    begin

    is_multiple <= '0' when to_integer(unsigned(b)) = 0 or to_integer(unsigned(a)) = 0  else
    '1' when (to_integer(unsigned(a)) rem to_integer(unsigned(b))) = 0 else
        '0';


    invalid_input <= '1' when to_integer(unsigned(a)) = 0 or to_integer(unsigned(b)) = 0 else  '0';
    end architecture rtl;
