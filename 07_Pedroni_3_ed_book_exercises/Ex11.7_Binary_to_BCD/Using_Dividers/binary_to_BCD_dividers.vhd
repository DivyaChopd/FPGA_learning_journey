-- ============================================================================================
-- Module: Binary to BCD with dividers method
-- Inputs:1 -> bin - 12 bits
-- Outputs:1 -> bcd - 16 bits
-- ============================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity binary_to_BCD_dividers is
    port(
        bin : in std_logic_vector(11 downto 0);
        --
        bcd : out std_logic_vector(15 downto 0)
    );
end entity binary_to_BCD_dividers;

architecture rtl of binary_to_BCD_dividers is
    signal r0: integer := 0;
    signal q0 : integer := 0;

    signal r1: integer;
    signal q1 : integer;

    signal r2: integer;
    signal q2 : integer;

    begin
        q0 <= to_integer(bin)/10;
        r0 <= to_integer(bin) mod 10;

        q1 <= q0/10;
        r1 <= q0 mod 10;

        q2 <= q1/10;
        r2 <= q1 mod 10;

        bcd <= to_std_logic_vector(q2,4) & to_std_logic_vector(r2,4) & to_std_logic_vector(r1,4) & to_std_logic_vector(r0,4);

    end architecture rtl;
    
