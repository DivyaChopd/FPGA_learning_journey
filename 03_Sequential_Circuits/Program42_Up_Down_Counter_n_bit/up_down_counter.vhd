-- =================================================================================================
-- Module: Up down counter
-- Inputs: 3 -> clk,rst, dir
-- Outputs: 1 -> count
-- Constants: 1 -> c_BITS
-- ==================================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity up_down_counter is
    generic(
        c_BITS : natural := 3
    );
    port(
        clk,rst,dir: in std_logic;
        count: out std_logic_vector(c_BITS-1 downto 0)
    );
end entity up_down_counter;

architecture rtl of up_down_counter is
    signal q : unsigned(c_BITS-1 downto 0) := (others => '0');
    begin

        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    q <= (others => '0');

                elsif dir = '0' then
                    q <= q +1;

                else q <= q-1;

                end if;
            end if;
        end process;

        count <= std_logic_vector(q);
    end architecture rtl;


                



