-- =======================================================================================
-- Testbench : Comparator 1-bit
-- =======================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity comparator_1bit_tb is
end entity comparator_1bit_tb;

architecture behave of comparator_1bit_tb is
    signal r_DATA1 : std_logic := '0';
    signal r_DATA2 : std_logic := '0';
    signal w_EQUAL : std_logic;
    signal w_DATA1_GREATER : std_logic;
    signal w_DATA2_GREATER : std_logic;

    begin
        uut : entity work.comparator_1bit
        port map(
            i_data1 => r_DATA1,
            i_data2 => r_DATA2,
            o_equal => w_EQUAL,
            o_data1_greater => w_DATA1_GREATER,
            o_data2_greater => w_DATA2_GREATER
        );

    process is
        begin
            r_DATA1 <= '0';
            r_DATA2 <= '0';
            wait for 20 ns;
            assert(w_EQUAL ='1' and w_DATA1_GREATER ='0' and w_DATA2_GREATER ='0')
            report "TC1 fail"
            severity ERROR;

            r_DATA1 <= '0';
            r_DATA2 <= '1';
            wait for 20 ns;
            assert(w_EQUAL ='0' and w_DATA1_GREATER ='0' and w_DATA2_GREATER ='1')
            report "TC2 fail"
            severity ERROR;

            r_DATA1 <= '1';
            r_DATA2 <= '0';
            wait for 20 ns;
            assert(w_EQUAL ='0' and w_DATA1_GREATER ='1' and w_DATA2_GREATER ='0')
            report "TC3 fail"
            severity ERROR;

            r_DATA1 <= '1';
            r_DATA2 <= '1';
            wait for 20 ns;
            assert(w_EQUAL ='1' and w_DATA1_GREATER ='0' and w_DATA2_GREATER ='0')
            report "TC4 fail"
            severity ERROR;

            
            report" All test cases passed!"
            severity NOTE;
            wait;

        end process;
    end architecture behave;



