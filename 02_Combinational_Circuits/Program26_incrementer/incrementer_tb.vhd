-- ===================================================================
-- Testbench: n-bit Incrementer
-- ===================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity incrementer_tb is
end entity incrementer_tb;

architecture behave of incrementer_tb is
    constant c_WIDTH : natural := 4;

    signal r_DATA : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
    signal w_INCREMENTER : std_logic_vector(c_WIDTH-1 downto 0);

    begin 
        uut: entity work.incrementer
        generic map(
            g_width => c_WIDTH 
        )
        port map(
            i_data => r_DATA,
            o_incrementer => w_INCREMENTER
        );

        process is
            begin

                r_DATA <= std_logic_vector(to_signed(-2,c_WIDTH));
                wait for 20 ns;
                assert signed(w_INCREMENTER(c_WIDTH-1 downto 0)) = to_signed(-1,c_WIDTH);

                r_DATA <= std_logic_vector(to_signed(-1,c_WIDTH));
                wait for 20 ns;
                assert signed(w_INCREMENTER(c_WIDTH-1 downto 0)) = to_signed(0,c_WIDTH);

                r_DATA <= "0000";
                wait for 20 ns;

                r_DATA <= "0001";
                wait for 20 ns;

                r_DATA <= "0010";
                wait for 20 ns;    


	end process;

            end architecture behave;
