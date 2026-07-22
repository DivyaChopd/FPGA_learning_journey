-- ===========================================================================
-- Module: MOD N counter
-- Inputs: 2 -> clk, rst
-- Outputs: 1 -> count
-- Constants: 1 -> c_BITS
-- ==========================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.subprogram_pkg.all;

entity mod_counter is
    generic(
        c_MOD: natural := 10
    );
    port(
        clk,rst : in std_logic;
        count: out std_logic_vector((clog2(c_MOD))-1  downto 0)
    );
end entity mod_counter;

architecture rtl of mod_counter is
    signal q : unsigned((clog2(c_MOD))-1 downto 0);
    begin

        process (clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                         q <= (others => '0');
                elsif q = c_MOD-1 then
                        q <= (others => '0');
                else
                        q <= q + 1;
                end if;
            end if;
        end process;

        count <= std_logic_vector(q);
    end architecture rtl;
