-- ================================================================================
-- Testbench: MOD 5 counter
-- ================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.subprogram_pkg.all;

entity mod_counter_tb is
end entity mod_counter_tb;

architecture behave of  mod_counter_tb is
    constant c_MOD : natural :=10;
    signal r_CLK, r_RST : std_logic := '0';
    signal w_COUNT : std_logic_vector((clog2(c_MOD))-1  downto 0);

    begin
        uut: entity work.mod_counter
        generic map(c_MOD)
        port map(r_CLK,r_RST,w_COUNT);

    p_clk: process
    begin
        wait for 20 ns;
        r_CLK <= not r_CLK;
    end process p_clk;

    p_rst: process
    begin
        wait for 20 ns;
        r_RST <= '1';
        wait for 40 ns;
        r_RST <= '0';
        wait;
    end process p_rst;

end architecture behave;


