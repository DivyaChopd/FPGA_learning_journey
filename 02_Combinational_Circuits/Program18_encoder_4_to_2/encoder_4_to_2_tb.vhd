--==============================================================
-- Testbench: 4-to-2 encoder
-- Tests all valid input combinations.
--==============================================================

library ieee;
use ieee.std_logic_1164.all;

entity encoder_4_to_2_tb is
end entity encoder_4_to_2_tb;

architecture behave of encoder_4_to_2_tb is
    signal r_DATA : std_logic_vector(3 downto 0) := "0000";
    signal r_SELECT : std_logic;
    signal w_RESULT : std_logic_vector(1 downto 0);
    begin
        uut : entity work.encoder_4_to_2
            port map(
                i_data => r_DATA,
                i_select => r_SELECT,
                o_result => w_RESULT
            );

    process is
        begin

-- ------------------------------------------------------
-- Test with SELECT ='0' (all outputs should be 00)
-- ------------------------------------------------------
            r_SELECT <= '0';

            r_DATA <= "0001";
            wait for 20 ns;
            assert w_RESULT = "00" 
            report "TC1: Enable = 0, Input = 00001, Expected = 00"
            severity ERROR;

            r_DATA <= "0010";
            wait for 20 ns;
            assert w_RESULT = "00" 
            report "TC1: Enable = 0, Input = 0010, Expected = 00"
            severity ERROR;

            r_DATA <= "0100";
            wait for 20 ns;
            assert w_RESULT = "00" 
            report "TC1: Enable = 0, Input = 0100, Expected = 00"
            severity ERROR;

            r_DATA <= "1000";
            wait for 20 ns;
            assert w_RESULT = "00" 
            report "TC1: Enable = 0, Input = 1000, Expected = 00"
            severity ERROR;

-- ------------------------------------------------------
-- Test with SELECT ='1' (normal encoding)
-- ------------------------------------------------------
            r_SELECT <= '1';

            r_DATA <= "0001";
            wait for 20 ns;
            assert w_RESULT = "00" 
            report "TC1: Enable = 0, Input = 00001, Expected = 00"
            severity ERROR;

            r_DATA <= "0010";
            wait for 20 ns;
            assert w_RESULT = "01" 
            report "TC1: Enable = 0, Input = 0010, Expected = 01"
            severity ERROR;

            r_DATA <= "0100";
            wait for 20 ns;
            assert w_RESULT = "10" 
            report "TC1: Enable = 0, Input = 0100, Expected = 10"
            severity ERROR;

            r_DATA <= "1000";
            wait for 20 ns;
            assert w_RESULT = "11" 
            report "TC1: Enable = 0, Input = 1000, Expected = 11"
            severity ERROR;

-- -----------------------------------------------------------------
            report "All test cases passed!"
            severity NOTE;

        end process;
    end architecture behave;



