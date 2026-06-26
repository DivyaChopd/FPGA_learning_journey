library ieee;
use ieee.std_logic_1164.all;

entity NOR_gate_tb is
end;

architecture behave of NOR_gate_tb is
    signal r_BIT1 : std_logic := '0';
    signal r_BIT2 : std_logic := '0';

    signal w_result : std_logic;

    begin
        uut: entity work.NOR_gate
        port map(
            i_bit1 => r_BIT1,
            i_bit2 => r_BIT2,

            o_result => w_result
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
        end;

