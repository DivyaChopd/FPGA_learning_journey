-- =====================================================================================
-- Module: D Flip Flop 
-- Inputs: 3 -> data_in , clk, reset
-- Output: 1 -> data_out
-- Description: for rising_edge(clk) output follows input otherwise previous state
-- =====================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity d_FF is
    port(
        i_data_in: in std_logic;
        i_clk: in std_logic;
        i_reset: in std_logic;
        --
        o_data_out: out std_logic
    );
end entity d_FF;

architecture rtl of d_FF is
    begin
        p_dFF : process(i_clk,i_reset) is
            begin
                if i_reset ='1' then
                    o_data_out <= '0';

                        elsif rising_edge(i_clk) then 
                            o_data_out <= i_data_in;
                end if;
            end process;
        end architecture rtl;