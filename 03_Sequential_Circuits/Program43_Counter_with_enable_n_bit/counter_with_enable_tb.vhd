-- ================================================================================
-- Testbench: Counter with enable
-- ================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_with_enable_tb is
end entity counter_with_enable_tb;

architecture behave of counter_with_enable_tb is
    constant c_BITS : natural := 4;
    signal r_CLK, r_RST, r_EN : std_logic := '0';
    signal w_DOUT : std_logic_vector(c_BITS-1 downto 0);

    begin
        uut: entity work.counter_with_enable
        generic map(c_BITS)
        port map(r_CLK,r_RST,r_EN,w_DOUT);

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

    p_en: process
    begin
        wait for 80 ns;
        r_EN <= not r_EN;
        wait for 80 ns;
         r_EN <= not r_EN;
        wait for 160 ns;
         r_EN <= not r_EN;
        wait for 160 ns;
         r_EN <= not r_EN;
        wait;
    end process p_en;

end architecture behave;


