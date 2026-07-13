-- ===========================================================================
-- Module: Unsigned and signed integer multiplier
-- Inputs: 2 -> a,b 
-- Outputs: 2 -> prod_uns, prod_sig
-- Constants: 1->  c_WIDTH
-- ===========================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
    generic(
        c_WIDTH : natural := 4
    );
    port(
        a, b : in std_logic_vector(c_WIDTH-1 downto 0);
        --
        prod_uns , prod_sig : out std_logic_vector((2*c_WIDTH)-1 downto 0)
    );
end entity multiplier;

architecture rtl of multiplier is
    begin
        prod_uns <= std_logic_vector(unsigned(a) * unsigned(b));
        prod_sig <= std_logic_vector(signed(a) * signed(b));
    end architecture rtl;