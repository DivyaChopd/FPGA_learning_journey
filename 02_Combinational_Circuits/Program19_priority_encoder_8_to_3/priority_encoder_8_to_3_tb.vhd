-- =======================================================================================
-- Testbench : 8:3 priority encoder
-- Tests: enable=0, no input active, single inputs and priority conflict cases
-- =======================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity priority_encoder_8_to_3_tb is
end entity priority_encoder_8_to_3_tb;

architecture behave of priority_encoder_8_to_3_tb is
    signal r_DATA : std_logic_vector(7 downto 0) := "00000000";
    signal r_ENABLE : std_logic;
    signal w_RESULT : std_logic_vector(2 downto 0);
    signal w_VALID : std_logic;

    begin
        uut: entity work.priority_encoder_8_to_3
        port map(
            i_data=> r_DATA,
            i_enable => r_ENABLE,
            o_result=> w_RESULT,
            o_valid => w_VALID
        );

        process is
            begin

-- -------------------------------------------------------------------------
-- Test enable = '0' (outputs should be 000, valid = 0 )
-- -------------------------------------------------------------------------
                
                r_ENABLE <= '0';
                r_DATA <= "10000000";
                wait for 20 ns;
                assert ( w_RESULT <= "000" and w_VALID ='0')
                report "TC1 fail: enable = 0, input = 10000000 => expected output = 000 and valid = 0"
                severity ERROR;

-- -------------------------------------------------------------------------
-- Test no input active (enable =1 and data = 00000000)
-- -------------------------------------------------------------------------

                r_ENABLE <='1';
                r_DATA <= "00000000";
                wait for 20 ns;
                assert(w_RESULT <= "000" and w_VALID ='0')
                report "TC2 fail: enable = 1, input = 0000000000 => expecetd output = 000 and valid = 0"
                severity ERROR;

-- --------------------------------------------------------------------------
-- Single input active tests
-- --------------------------------------------------------------------------

                r_DATA <= "00000001";
                wait for 20 ns;
                assert(w_RESULT <= "000" and w_VALID ='1')
                report "TC3 fail: input = 0000000001 => expecetd output = 000 and valid = 1"
                severity ERROR;

                r_DATA <= "00000010";
                wait for 20 ns;
                assert(w_RESULT <= "001" and w_VALID ='1')
                report "TC4 fail: input = 0000000010 => expecetd output = 001 and valid = 1"
                severity ERROR;

                r_DATA <= "00000100";
                wait for 20 ns;
                assert(w_RESULT <= "010" and w_VALID ='1')
                report "TC5 fail: input = 00000100 => expecetd output = 010 and valid = 1"
                severity ERROR;

                r_DATA <= "00001000";
                wait for 20 ns;
                assert(w_RESULT <= "011"and  w_VALID ='1')
                report "TC6 fail: input = 00001000 => expecetd output = 011 and valid = 1"
                severity ERROR;

                r_DATA <= "00010000";
                wait for 20 ns;
                assert(w_RESULT <= "100" and w_VALID ='1')
                report "TC7 fail: input = 00010000 => expecetd output = 100 and valid = 1"
                severity ERROR;

                r_DATA <= "00100000";
                wait for 20 ns;
                assert(w_RESULT <= "101" and w_VALID ='1')
                report "TC8 fail: input = 00100000 => expecetd output = 101 and valid = 1"
                severity ERROR;

                r_DATA <= "01000000";
                wait for 20 ns;
                assert(w_RESULT <= "110" and w_VALID ='1')
                report "TC9 fail: input = 01000000 => expecetd output = 110 and valid = 1"
                severity ERROR;

                r_DATA <= "10000000";
                wait for 20 ns;
                assert(w_RESULT <= "111" and w_VALID ='1')
                report "TC10 fail: input = 10000000 => expecetd output = 111 and valid = 1"
                severity ERROR;

-- --------------------------------------------------------------------------
-- Priority conflict tests (highest index wins)
-- --------------------------------------------------------------------------

                r_DATA <= "11111111";
                wait for 20 ns;
                assert(w_RESULT <= "111" and w_VALID ='1')
                report "TC11 fail: input = 11111111 => expecetd output = 111 and valid = 1"
                severity ERROR;

                r_DATA <= "01111111";
                wait for 20 ns;
                assert(w_RESULT <= "110" and w_VALID ='1')
                report "TC12 fail: input = 11111111 => expecetd output = 110 and valid = 1"
                severity ERROR;

                r_DATA <= "00111111";
                wait for 20 ns;
                assert(w_RESULT <= "101" and w_VALID ='1')
                report "TC13 fail: input = 11111111 => expecetd output = 101 and valid = 1"
                severity ERROR;

                r_DATA <= "00011111";
                wait for 20 ns;
                assert(w_RESULT <= "100" and w_VALID ='1')
                report "TC14 fail: input = 11111111 => expecetd output = 100 and valid = 1"
                severity ERROR;

                r_DATA <= "00001111";
                wait for 20 ns;
                assert(w_RESULT <= "011" and w_VALID ='1')
                report "TC15 fail: input = 11111111 => expecetd output = 011 and valid = 1"
                severity ERROR;

                r_DATA <= "00000111";
                wait for 20 ns;
                assert(w_RESULT <= "010" and w_VALID ='1')
                report "TC16 fail: input = 11111111 => expecetd output = 010 and valid = 1"
                severity ERROR;

                r_DATA <= "00000011";
                wait for 20 ns;
                assert(w_RESULT <= "001" and w_VALID ='1')
                report "TC17 fail: input = 11111111 => expecetd output = 001 and valid = 1"
                severity ERROR;

                r_DATA <= "00000001";
                wait for 20 ns;
                assert(w_RESULT <= "000" and w_VALID ='1')
                report "TC18 fail: input = 11111111 => expecetd output = 000 and valid = 1"
                severity ERROR;

-- --------------------------------------------------------------------------
                
                report "All test cases passed!"
                severity NOTE;
                wait;

            end process;
        end architecture behave;
