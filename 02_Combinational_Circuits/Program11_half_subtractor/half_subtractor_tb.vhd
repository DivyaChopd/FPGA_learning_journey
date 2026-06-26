library ieee;
use ieee.std_logic_1164.all;

entity half_subtractor_tb is
end entity half_subtractor_tb;

architecture behave of half_subtractor_tb is
    signal r_BIT1 : std_logic := '0';
    signal r_BIT2 : std_logic := '0';

    signal w_DIFF : std_logic;
    signal w_BORROW : std_logic;

    begin
        uut : entity work.half_subtractor
        port map(
            i_bit1 => r_BIT1,
            i_bit2 => r_BIT2,

            o_diff => w_DIFF,
            o_borrow => w_BORROW
        );

        process is
            begin
                r_BIT1 <= '0';
                r_BIT2 <= '0';
                wait for 20 ns;

                r_BIT1 <= '0';
                r_BIT2 <= '1';
                wait for 20 ns;

                r_BIT1 <= '1';
                r_BIT2 <= '0';
                wait for 20 ns;

                r_BIT1 <= '1';
                r_BIT2 <= '1';
                wait for 20 ns;

            end process;
        end architecture behave;


