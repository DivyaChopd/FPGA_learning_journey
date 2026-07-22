-- ===================================================================================
-- Module: Ring Counter
-- Inputs: 1-> clk
-- Outputs: 1 -> count
-- Constants : 1 -> BITS
-- ===================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity ring_counter is
    generic(
        BITS : natural :=4
    );
    port(
        clk : in std_logic;
        count : out std_logic_vector(BITS-1 downto 0)
    );
end entity ring_counter;

architecture rtl of ring_counter is
      signal q : std_logic_vector(BITS-1 downto 0) := (BITS-1 =>'1' , others => '0');
        begin

        process(clk)
        begin
        if rising_edge(clk) then
           q <= q(0) & q(BITS-1 downto 1);
        end if;
        end process;

    count <= q;
    
end architecture rtl;
