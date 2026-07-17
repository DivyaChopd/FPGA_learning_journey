-- ====================================================================
-- Testbench: N-bit Shift register
-- ====================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register_tb is
end entity shift_register_tb;

architecture behave of shift_register_tb is
    constant c_NUM_STAGES : natural := 4;
    constant c_NUM_BITS : natural := 8;
    signal r_clk : std_logic := '0';
    signal r_din : std_logic_vector(c_NUM_BITS-1 downto 0) := (others => '0');
    signal w_dout : std_logic_vector(c_NUM_BITS-1 downto 0);

    begin
        uut: entity work.shift_register
        generic map(c_NUM_STAGES,c_NUM_BITS)
        port map(r_clk,r_din,w_dout);

    p_clk: process
    begin
        wait for 40 ns;
        r_CLK <= not r_CLK;
    end process p_clk;

    p_in: process
    begin
	wait for 80 ns;

        r_din <= std_logic_vector(to_unsigned(1,c_NUM_BITS));
        wait for 80 ns;

        r_din <= std_logic_vector(to_unsigned(0,c_NUM_BITS));
        wait for 80 ns;

  

        r_din <= std_logic_vector(to_unsigned(253,c_NUM_BITS));
        wait for 80 ns;

        r_din <= std_logic_vector(to_unsigned(254,c_NUM_BITS));
        wait for 80 ns;

        r_din <= std_logic_vector(to_unsigned(255,c_NUM_BITS));
        wait for 80 ns;

        r_din <= std_logic_vector(to_unsigned(0,c_NUM_BITS));
        wait for 80 ns;

        wait;
    end process p_in;

end architecture behave;



        