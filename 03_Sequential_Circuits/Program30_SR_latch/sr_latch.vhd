-- ====================================================================
-- Module: SR Latch
-- Inputs: 2 -> set,reset
-- Outputs: 2 -> data_out and data_out_comp
-- ====================================================================

library ieee;
use ieee.std_logic_1164.all;

entity sr_latch is
    port(
        i_set: in std_logic;
        i_reset: in std_logic;
        --
        o_data_out: out std_logic;
        o_data_out_comp: out std_logic
    );
end entity sr_latch;

architecture rtl of sr_latch is
begin

    p_sr_latch: process(i_set,i_reset) is
begin
-- ------------------------------------------------
-- Set state 
-- ------------------------------------------------

    if i_set = '1' and i_reset = '0' then
        o_data_out <= '1';
        o_data_out_comp <= '0';

-- ------------------------------------------------
-- Reset state 
-- ------------------------------------------------

    elsif i_set = '0' and i_reset = '1' then
        o_data_out <= '0';
        o_data_out_comp <= '1';

-- ------------------------------------------------
-- Invalid state 
-- ------------------------------------------------

elsif i_set = '1' and i_reset = '1' then
        o_data_out <= '0';
        o_data_out_comp <= '0';

end if;
end process p_sr_latch;
end architecture rtl;