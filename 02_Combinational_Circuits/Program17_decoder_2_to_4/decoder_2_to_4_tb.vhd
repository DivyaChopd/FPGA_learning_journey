-- ==================================================================
-- Testbench : 2:4 decoder
-- Test: Test inputs - 00,01,10,11 and enbale case
-- ==================================================================


library ieee;
use ieee.std_logic_1164.all;

entity decoder_2_to_4_tb is
end entity decoder_2_to_4_tb;

architecture behave of decoder_2_to_4_tb is
    signal r_DATA : std_logic_vector(1 downto 0) := "00";
    signal r_ENABLE : std_logic := '0';
    --
    signal w_RESULT : std_logic_vector(3 downto 0);

    begin 
        uut : entity work.decoder_2_to_4
        port map(
            i_data => r_DATA,
            i_enable => r_ENABLE,
            --
            o_result => w_RESULT
        );

        process is
            begin

-- --------------------------------------------------------------
-- Enable <= 0
-- --------------------------------------------------------------

                r_ENABLE <='0';
                r_DATA <= "11";
                wait for 20 ns;

-- --------------------------------------------------------------
-- Enable <= 1
-- --------------------------------------------------------------

                r_ENABLE <='1';
                r_DATA <= "00";
                wait for 20 ns;

                r_DATA <= "01";
                wait for 20 ns;

                r_DATA <= "10";
                wait for 20 ns;

                r_DATA <= "11";
                wait for 20 ns;
                   

            end process;
        end architecture behave;

