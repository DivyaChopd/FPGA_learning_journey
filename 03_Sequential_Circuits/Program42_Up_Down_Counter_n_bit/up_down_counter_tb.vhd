-- ================================================================================
-- Testbench: Up down counter
-- ================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity up_down_counter_tb is
end entity up_down_counter_tb;

architecture behave of  up_down_counter_tb is
    constant c_BITS : natural := 3;
    signal r_CLK, r_RST, r_DIR : std_logic := '0';
    signal w_DOUT : std_logic_vector(c_BITS-1 downto 0);

    begin
        uut: entity work.up_down_counter
        generic map(c_BITS)
        port map(r_CLK,r_RST,r_DIR,w_DOUT);

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

    p_dir: process
    begin
        wait for 80 ns;
        r_DIR <= not r_DIR;
        wait for 80 ns;
        r_DIR <= not r_DIR;
        wait for 160 ns;
        r_DIR <= not r_DIR;
        wait for 160 ns;
        wait;
    end process p_dir;

end architecture behave;


