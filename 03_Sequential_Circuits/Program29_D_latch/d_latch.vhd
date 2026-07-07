-- =======================================================================
-- Module: D latch 
-- Inputs: 2 -> data_in, enable
-- Output: 1 -> data_out
-- Description: When enable=1 then o/p = i/p, otherwise o/p = previous o/p
-- ========================================================================

library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
    port(
        i_data_in : in std_logic;
        i_enable : in std_logic;
        --
        o_data_out : out std_logic
    );
end entity d_latch;

architecture rtl of d_latch is
    begin
        p_dlatch: process(i_data_in,i_enable) is
            begin
                
                if i_enable = '1' then o_data_out <= i_data_in;
            end if;
        end process p_dlatch;
    end architecture rtl;