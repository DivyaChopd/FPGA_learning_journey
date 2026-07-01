library ieee;
use ieee.std_logic_1164.all;

entity demux_1_to_2_tb is
end entity demux_1_to_2_tb;

architecture behave of demux_1_to_2_tb is
    signal r_DATA : std_logic := '0';
    signal r_SELECT : std_logic;
    signal w_RESULT1 : std_logic;
    signal w_RESULT2 : std_logic;

    begin
        uut: entity work.demux_1_to_2
        port map(
            i_data => r_DATA,
            i_select => r_SELECT,
            o_result1 => w_RESULT1,
            o_result2 => w_RESULT2
        );

        process is
            begin
                r_SELECT <= '0';
                r_DATA <= '0';
                wait for 20 ns;

                r_SELECT <= '0';
                r_DATA <= '1';
                wait for 20 ns;

                r_SELECT <= '1';
                r_DATA <= '0';
                wait for 20 ns;

                r_SELECT <= '1';
                r_DATA <= '1';
                wait for 20 ns;

            end process;
        end architecture behave;
        
