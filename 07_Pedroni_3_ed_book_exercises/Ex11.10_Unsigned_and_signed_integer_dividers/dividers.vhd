-- ================================================================================
-- Module: Unsigned and signed integer dividers
-- Inputs: 2->  a,b 
-- Outputs: 4 -> quo_uns, re_uns, quo_sig, re_sig 
-- Constants: c_WIDTH 
-- ================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dividers is
    generic(
        c_WIDTH : natural := 4
    );
    port(
        a, b : in std_logic_vector(c_WIDTH-1 downto 0);
        quo_uns, re_uns, quo_sig, re_sig  : out std_logic_vector(c_WIDTH-1 downto 0)
    );
end entity dividers;

architecture rtl of dividers is
    begin
        quo_uns <= std_logic_vector(unsigned(a)/unsigned(b));
        re_uns <= std_logic_vector(unsigned(a) rem unsigned(b));

        quo_sig <= std_logic_vector(signed(a)/signed(b));
        re_sig <= std_logic_vector(signed(a) rem signed(b));

    end architecture rtl;