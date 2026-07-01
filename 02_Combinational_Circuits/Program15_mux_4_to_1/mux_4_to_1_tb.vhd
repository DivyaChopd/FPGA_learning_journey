library ieee;
use ieee.std_logic_1164.all;

entity mux_4_to_1_tb is
end entity mux_4_to_1_tb;

architecture behave of mux_4_to_1_tb is
    signal r_SELECT : std_logic_vector(1 downto 0);
    signal r_DATA1 : std_logic := '0';
    signal r_DATA2 : std_logic := '0';
    signal r_DATA3 : std_logic := '0';
    signal r_DATA4 : std_logic := '0';
    signal w_RESULT : std_logic;

    begin
    uut : entity work.mux_4_to_1 
    port map(
        i_select => r_SELECT,
        i_data1 => r_DATA1,
        i_data2 => r_DATA2,
        i_data3 => r_DATA3,
        i_data4 => r_DATA4,
        o_result => w_RESULT
    );

    process is
        begin
            r_SELECT <= "00";
            r_DATA1 <= '1';
            r_DATA2 <= '0';
            r_DATA3 <= '0';
            r_DATA4 <= '0';
            wait for 20 ns;

            r_SELECT <= "01";
            r_DATA1 <= '0';
            r_DATA2 <= '1';
            r_DATA3 <= '0';
            r_DATA4 <= '0';
            wait for 20 ns;

            r_SELECT <= "10";
            r_DATA1 <= '0';
            r_DATA2 <= '0';
            r_DATA3 <= '1';
            r_DATA4 <= '0';
            wait for 20 ns;

            r_SELECT <= "11";
            r_DATA1 <= '0';
            r_DATA2 <= '0';
            r_DATA3 <= '0';
            r_DATA4 <= '1';
            wait for 20 ns;

        end process;
    end architecture behave;

