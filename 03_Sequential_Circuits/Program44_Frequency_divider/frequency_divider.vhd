-- ============================================================================
-- Module: Frequency divider
-- Inputs: 2 -> clk,rst
-- Outputs: 2 -> i, clk_out
-- Constants: 1 -> STATES
-- =============================================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.subprogram_pkg.all;

entity frequency_divider is
    generic(
        STATES: natural := 7
    );
    port(
        clk,rst: in std_logic;
        i : out std_logic_vector((clog2(STATES))-1 downto 0);
        clk_out : out std_logic
    );
end entity frequency_divider;

architecture rtl of frequency_divider is
    signal q : unsigned((clog2(STATES))-1 downto 0) := (others => '0');
    signal r : std_logic := '0';
    begin

        process(clk)
        begin
            if rising_edge(clk) then

                if rst = '1' then
                    q <= (others => '0');
                    r <= '0';

                 -- Counter
                elsif q =  STATES-1 then
                    q <= (others => '0');
                
                else q <= q+1;
                end if;

                -- clk_out
                if q = STATES-1 then
                    r <= not r;
                end if;

        end if;
    end process;

    i <= std_logic_vector(q);
    clk_out <= r;

end architecture rtl;

