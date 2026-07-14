-- ========================================================================
-- Module: Division of integers with rounding
-- Inputs: 2 -> a,b 
-- Outputs: 1 -> quo
-- Constants: 1 -> c_WIDTH
-- =========================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity division_with_round is
    generic(
        c_WIDTH : natural 
    );
    port(
        a,b: in std_logic_vector(c_WIDTH-1 downto 0);
        quo : out std_logic_vector(c_WIDTH-1 downto 0)
    );
end entity division_with_round;

architecture rtl of division_with_round is
    begin
        quo <= std_logic_vector(to_unsigned((integer(round(real(to_integer(unsigned(a)))/real(to_integer(unsigned(b)))))),c_WIDTH));
    end architecture rtl;