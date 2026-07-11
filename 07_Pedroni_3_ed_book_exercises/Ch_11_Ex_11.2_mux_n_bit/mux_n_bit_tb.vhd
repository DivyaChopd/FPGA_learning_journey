-- ====================================================================
-- Testbench: N-bit Multiplexer
-- ====================================================================

library ieee;
use ieee.std_logic_1164.all;

entity mux_n_bit_tb is
end entity mux_n_bit_tb;

architecture behave of mux_n_bit_tb is
    constant c_NUM_INPUTS : natural := 8;
    constant  c_NUM_BITS :natural := 4 ;
    --
    signal r_DATA_IN: std_logic_vector(c_NUM_INPUTS*c_NUM_BITS -1 downto 0);
    signal r_SEL : natural range 0 to c_NUM_INPUTS-1;
    --
    signal w_DATA_OUT: std_logic_vector(c_NUM_BITS-1 downto 0);

    begin
        uut: entity work.mux_n_bit
        generic map(c_NUM_INPUTS, c_NUM_BITS)
        port map(r_DATA_IN,r_SEL,w_DATA_OUT);

    p_sel: process
    begin
        for i in 0 to c_NUM_INPUTS-1 loop
        r_SEL <= i;
        wait for 20 ns;
        end loop;
    end process p_sel;

    p_data_in : process
    begin
        r_DATA_IN <= "1111" & "1110" & "1101" & "1100" & "1011" & "1010" & "1001" & "1000";
	wait;
    end process p_data_in;

end architecture behave;
