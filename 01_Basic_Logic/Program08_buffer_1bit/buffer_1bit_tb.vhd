library ieee;
use ieee.std_logic_1164.all;

entity buffer_1bit_tb is
end entity buffer_1bit_tb;

architecture behave of buffer_1bit_tb is
    signal r_BIT : std_logic := '0';
    signal w_BIT : std_logic := '0';

    begin
        uut : entity work.buffer_1bit
        port map(
            i_bit => r_BIT,
            o_bit => w_BIT
        );

    process is
        begin
            r_BIT <= '0';
            wait for 20 ns;

            r_BIT <= '1';
            wait for 20 ns;

        end process;
    end architecture behave;
    

