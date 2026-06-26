library ieee;
use ieee.std_logic_1164.all;

entity MUX_2_to_1_tb is
end entity MUX_2_to_1_tb;

architecture behave of MUX_2_to_1_tb is
    signal r_DATA1 : std_logic := '1';
    signal r_DATA2 : std_logic := '1';

    signal r_SELECT : std_logic;
    signal w_RESULT : std_logic;

    begin
        uut : entity work.MUX_2_to_1
        port map(
            i_data1 => r_DATA1,
            i_data2 => r_DATA2,
            i_select => r_SELECT,
            o_result => w_RESULT
        );

        process is
            begin
                r_SELECT <='0';
                r_DATA1 <= '0';
                r_DATA2 <= '0';
                wait for 10 ns;

                r_SELECT <='0';
                r_DATA1 <= '0';
                r_DATA2 <= '1';
                wait for 10 ns;

                r_SELECT <='0';
                r_DATA1 <= '1';
                r_DATA2 <= '0';
                wait for 10 ns;

                r_SELECT <='0';
                r_DATA1 <= '1';
                r_DATA2 <= '1';
                wait for 10 ns;


                r_SELECT <='1';
                r_DATA1 <= '0';
                r_DATA2 <= '0';
                wait for 10 ns;

                r_SELECT <='1';
                r_DATA1 <= '0';
                r_DATA2 <= '1';
                wait for 10 ns;

                r_SELECT <='1';
                r_DATA1 <= '1';
                r_DATA2 <= '0';
                wait for 10 ns;

                r_SELECT <='1';
                r_DATA1 <= '1';
                r_DATA2 <= '1';
                wait for 10 ns;

                

            end process;
        end architecture behave;
