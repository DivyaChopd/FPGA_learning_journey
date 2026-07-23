-- =======================================================================
-- Module: Floating-point subtractor and divider
-- Inputs: 2-> a,b
-- Outputs: 2-> sum,prod
-- =======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.float_pkg.all;

entity fp_subtractor_divider is
    port(
        a,b : in std_logic_vector(8 downto 0);
        sub,div: out std_logic_vector(8 downto 0)
    );
end entity fp_subtractor_divider;

architecture rtl of fp_subtractor_divider is
    begin
        sub <= std_logic_vector(to_float(a,5,3) - to_float(b,5,3));
        div <= std_logic_vector(to_float(a,5,3) / to_float(b,5,3));
    end architecture rtl;