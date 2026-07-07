-- ===========================================================
-- Module: T Flip Flop
-- Inputs: 2 -> clk, t
-- Output: 1 -> q
-- Description: For rising clock edge output = toggle (input)
-- ============================================================

library ieee;
use ieee.std_logic_1164.all;

entity t_ff is
    port(
        i_t : in std_logic;
        i_clk: in std_logic;
        --
        o_q: out std_logic
    );
end entity t_ff;

architecture rtl of t_ff is
    signal r_q : std_logic := '0';

    begin
        p_t : process(i_clk)
begin
        if rising_edge(i_clk) then
            if i_t = '0' then
                null;
            else r_q <= not r_q;
            end if;
        else null;
    end if;
end process;
o_q <= r_q;
end architecture rtl;

