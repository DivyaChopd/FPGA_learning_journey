-- ================================================================================
-- Testbench: Frequency divider
-- ================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.subprogram_pkg.all;

entity frequency_divider_tb is
end entity frequency_divider_tb;

architecture behave of  frequency_divider_tb is
    constant c_MOD : natural := 7;
    signal r_CLK, r_RST : std_logic := '0';
    signal w_I : std_logic_vector((clog2(c_MOD))-1  downto 0);
    signal w_CLK_OUT : std_logic := '0';

    begin
        uut: entity work.frequency_divider
        generic map(c_MOD)
        port map(r_CLK,r_RST,w_I,w_CLK_OUT);

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


