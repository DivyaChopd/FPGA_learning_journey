-- ==============================================================================
-- Module: Johnson counter
-- Inputs: 2 -> clk
-- Outputs: 1 -> count
-- Constants: 1 -> BITS
-- ==============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity johnson_counter is
    generic(
    c_BITS : natural :=4);
    port(
        clk: in std_logic;
        clr: in std_logic;
        count : out std_logic_vector(c_BITS-1 downto 0)
    );
end entity johnson_counter ;

architecture rtl of johnson_counter is
    signal q : std_logic_vector(c_BITS-1 downto 0);
    begin

        process(clk)
        begin
            if rising_edge(clk) then
                if clr = '0' then
                q <= not q(0) & q(c_BITS-1 downto 1);
                else
                    q <= ( others => '0');
            end if;
            end if;
        end process;

        count <= q;
        
    end architecture rtl;

