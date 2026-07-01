library ieee;
use ieee.std_logic_1164.all;

entity mux_2_to_1_width_tb is
end entity mux_2_to_1_width_tb;

architecture behave of mux_2_to_1_width_tb is
    constant c_WIDTH : integer :=8;

    signal r_DATA1 : std_logic_vector(c_WIDTH-1 downto 0) :="00000000";
    signal r_DATA2 : std_logic_vector(c_WIDTH-1 downto 0) :="00000000";
    signal r_select : std_logic;

    signal w_result : std_logic_vector(c_WIDTH-1 downto 0);

    begin
        uut: entity work.mux_2_to_1_width 
	generic map(g_width => c_WIDTH)

        port map(
      
            i_data1 => r_DATA1,
            i_data2 => r_DATA2,
            i_select => r_select,
            o_result => w_result
        );

        process is
            begin
                r_DATA1 <= "10101010";
                r_DATA2 <= "00001111";
                r_SELECT <= '0';
                wait for 80 ns;

                r_DATA1 <= "10101010";
                r_DATA2 <= "00001111";
                r_SELECT <= '1';
                wait for 80 ns;

            end process;
        end architecture behave;

