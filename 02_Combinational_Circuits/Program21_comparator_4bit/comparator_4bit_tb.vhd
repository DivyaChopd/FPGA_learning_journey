-- =======================================================================================
-- Testbench : Comparator 4-bit
-- Tests equal, greater than and less than cases
-- =======================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity comparator_4bit_tb is
end entity comparator_4bit_tb;

architecture behave of comparator_4bit_tb is
    signal r_DATA1 : std_logic_vector(3 downto 0) := "0000";
    signal r_DATA2 : std_logic_vector(3 downto 0) := "0000";

    signal w_EQUAL : std_logic;
    signal w_GREATER_THAN : std_logic;
    signal w_LESS_THAN : std_logic;

    begin
        uut: entity work.comparator_4bit
        port map(
            i_data1 => r_DATA1,
            i_data2 => r_DATA2,
            o_equal => w_EQUAL,
            o_greater_than => w_GREATER_THAN,
            o_less_than => w_LESS_THAN
        );

        process is
            begin

-- ---------------------------------------------------------------------------
-- equal cases
-- ---------------------------------------------------------------------------
                r_DATA1 <= "0000";
                r_DATA2 <= "0000";
                wait for 20 ns;
                assert(w_EQUAL <= '1' and w_GREATER_THAN <= '0' and w_LESS_THAN <= '0')
                report "TC1 fail"
                severity ERROR;

                r_DATA1 <= "1111";
                r_DATA2 <= "1111";
                wait for 20 ns;
                assert(w_EQUAL <= '1' and w_GREATER_THAN <= '0' and w_LESS_THAN <= '0')
                report "TC2 fail"
                severity ERROR;

                r_DATA1 <= "1010";
                r_DATA2 <= "1010";
                wait for 20 ns;
                assert(w_EQUAL <= '1' and w_GREATER_THAN <= '0' and w_LESS_THAN <= '0')
                report "TC3 fail"
                severity ERROR;

-- ---------------------------------------------------------------------------
-- greater than cases
-- ---------------------------------------------------------------------------       

                r_DATA1 <= "1010";
                r_DATA2 <= "0010";
                wait for 20 ns;
                assert(w_EQUAL <= '0' and w_GREATER_THAN <= '1' and w_LESS_THAN <= '0')
                report "TC4 fail"
                severity ERROR;

                r_DATA1 <= "1111";
                r_DATA2 <= "0000";
                wait for 20 ns;
                assert(w_EQUAL <= '0' and w_GREATER_THAN <= '1' and w_LESS_THAN <= '0')
                report "TC5 fail"
                severity ERROR;

-- ---------------------------------------------------------------------------
-- less than cases
-- --------------------------------------------------------------------------- 

                r_DATA1 <= "0110";
                r_DATA2 <= "1010";
                wait for 20 ns;
                assert(w_EQUAL <= '0' and w_GREATER_THAN <= '0' and w_LESS_THAN <= '1')
                report "TC6 fail"
                severity ERROR;

                r_DATA1 <= "1010";
                r_DATA2 <= "1011";
                wait for 20 ns;
                assert(w_EQUAL <= '0' and w_GREATER_THAN <= '0' and w_LESS_THAN <= '1')
                report "TC7 fail"
                severity ERROR;

-- ---------------------------------------------------------------------------------

                report "All test cases passed!"
                severity NOTE;

            end process;
        end architecture behave;