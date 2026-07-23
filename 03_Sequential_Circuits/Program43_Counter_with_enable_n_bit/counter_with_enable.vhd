-- =================================================================================================
-- Module: Counter with enable
-- Inputs: 3 -> clk,rst,en
-- Outputs: 1 -> count
-- Constants: 1 -> c_BITS
-- ==================================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_with_enable is
    generic(
        c_BITS: natural := 4
    );
    port(
        clk,rst,en : in std_logic;
        count: out std_logic_vector(c_BITS-1 downto 0)
    );
end entity counter_with_enable;

architecture rtl of counter_with_enable is
    signal q : unsigned(c_BITS-1 downto 0) := (others => '0');
    begin

        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    q <= (others => '0');

                elsif en = '0' then
                    q <= q;

                else q <= q + 1;

            end if;
        end if;
    end process;

    count <= std_logic_vector(q);
end architecture rtl;

