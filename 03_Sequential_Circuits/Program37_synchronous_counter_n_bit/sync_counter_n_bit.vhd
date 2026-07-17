-- ======================================================================
-- Module: n-bit synchronous counter with is_max flag
-- Inputs: 1 -> clk
-- Outputs: 2 -> count, is_max
-- Constant: 2 -> BITS
-- =======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity sync_counter_n_bit is
    generic(
        c_BITS : natural := 3  
    );
    port(
        clk : in std_logic;
        count : out std_logic_vector(c_BITS-1 downto 0);
        is_max : out std_logic
    );
end entity sync_counter_n_bit;

architecture rtl of sync_counter_n_bit is
    constant c_MAX : natural := (2**c_BITS)-1;
    begin

        process(clk)
        variable i : natural range 0 to c_MAX;
        begin

            -- Counter
            if rising_edge(clk) then
                if i /=c_MAX then
                    i := i+1;
                else
                    i := 0;
                end if;
            end if;
            count <= std_logic_vector(to_unsigned(i,c_BITS));

            
            -- Flag generator
            if rising_edge(clk) then
                if i = c_MAX-1 then
                    is_max <= '1';
                else
                    is_max <= '0';
                end if;
            end if;

        end process;
    end architecture rtl;