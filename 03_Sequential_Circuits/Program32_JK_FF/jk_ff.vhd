-- =========================================================================
-- Module: JK Flip Flop
-- Inputs: 3 -> i_j,i_k, i_clk 
-- Output: 1 -> o_q
-- =========================================================================

library ieee;
use ieee.std_logic_1164.all;

entity jk_ff is
    port(
        i_j : in std_logic;
        i_k : in std_logic;
        i_clk : in std_logic;
        --
        o_q : out std_logic
    );
end entity;

architecture rtl of jk_ff is
    signal r_q : std_logic := '0';

    begin

        p_jk: process(i_clk)
        begin
		if rising_edge(i_clk) then 
                    if i_j = '0' and i_k = '0' then
                        null;

                	   elsif i_j = '0' and i_k = '1' then
                    	r_q <= '0';
            
                    	elsif i_j = '1' and i_k = '0' then
                    	r_q <= '1';
                       
                        else 
                        r_q <= not r_q;
                        end if;
		end if;
    end process p_jk;

    o_q <= r_q;
end architecture rtl;

