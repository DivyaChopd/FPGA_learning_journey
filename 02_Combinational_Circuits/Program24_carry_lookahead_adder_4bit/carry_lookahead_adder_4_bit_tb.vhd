-- =========================================================================
-- Testbench: 4 bit Carry lookahead adder
-- =========================================================================

library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_adder_4_bit_tb is
end entity carry_lookahead_adder_4_bit_tb;

architecture behave of carry_lookahead_adder_4_bit_tb is
    signal r_ADD_TERM1 : std_logic_vector(3 downto 0) := "0000";
    signal r_ADD_TERM2 : std_logic_vector(3 downto 0) := "0000";
    --
    signal w_RESULT : std_logic_vector(4 downto 0);

    begin
        uut: entity work.carry_lookahead_adder_4_bit
        port map(
            i_add_term1 => r_ADD_TERM1,
            i_add_term2 => r_ADD_TERM2,
            o_result => w_RESULT
        );

    process is
        begin
            r_ADD_TERM1 <= "1001";
            r_ADD_TERM2 <= "0101";
            wait for 20 ns;

            r_ADD_TERM1 <= "1011";
            r_ADD_TERM2 <= "0111";
            wait for 20 ns;

            r_ADD_TERM1 <= "0001";
            r_ADD_TERM2 <= "0101";
            wait for 20 ns;

            r_ADD_TERM1 <= "1111";
            r_ADD_TERM2 <= "1111";
            wait for 20 ns;

        end process;
    end architecture behave;
            
