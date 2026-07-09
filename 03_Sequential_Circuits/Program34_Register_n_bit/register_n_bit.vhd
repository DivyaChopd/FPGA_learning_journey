-- ================================================================
-- Module: Register n-bit
-- Inputs: 4 -> d(n), load, clk, rst
-- Outputs: 1 -> q(n) 
-- ===============================================================
library ieee;
use ieee.std_logic_1164.all;

entity register_n_bit is
    generic(
        g_width : natural := 4
    );
    port(
        i_clk,i_rst,i_load : in std_logic;
        i_d : in std_logic_vector(g_width-1 downto 0);
        --
        o_q : out std_logic_vector(g_width-1 downto 0)
    );
end entity register_n_bit;

architecture rtl of register_n_bit is
    begin
        p_reg_n: process(i_clk,i_rst)
        begin
            if i_rst = '1' then 
                o_q <= (others => '0');
            elsif rising_edge(i_clk) then
                    if i_load ='1' then
                        o_q <= i_d;
                    end if;
            end if;
        end process p_reg_n;
    end architecture rtl;

