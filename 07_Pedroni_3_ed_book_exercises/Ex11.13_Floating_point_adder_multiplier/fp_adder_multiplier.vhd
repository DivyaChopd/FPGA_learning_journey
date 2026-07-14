-- =======================================================================
-- Module: Floating-point adder and multiplier
-- Inputs: 2-> a,b
-- Outputs: 2-> sum,prod
-- =======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.float_pkg.all;

entity fp_adder_multiplier is
    port(
        a,b : in std_logic_vector(8 downto 0);
        sum,prod: out std_logic_vector(8 downto 0)
    );
end entity fp_adder_multiplier;

architecture rtl of fp_adder_multiplier is
    begin
        sum <= std_logic_vector(to_float(a,5,3) + to_float(b,5,3));
        prod <= std_logic_vector(to_float(a,5,3) * to_float(b,5,3));
    end architecture rtl;