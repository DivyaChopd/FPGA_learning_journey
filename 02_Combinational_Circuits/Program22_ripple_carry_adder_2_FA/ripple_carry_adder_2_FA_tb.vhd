-- ====================================================================
-- Testbench: 2-bit Ripple Carry Adder
-- ====================================================================

library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder_2_FA_tb is
end entity ripple_carry_adder_2_FA_tb;

architecture behave of ripple_carry_adder_2_FA_tb is
    signal r_ADD_TERM1 : std_logic_vector(1 downto 0) := "00";
    signal r_ADD_TERM2 : std_logic_vector(1 downto 0) := "00";
    --
    signal w_RESULT : std_logic_vector(2 downto 0);

    begin
        uut : entity work.ripple_carry_adder_2_FA
        port map(
            i_add_term1 => r_ADD_TERM1,
            i_add_term2 => r_ADD_TERM2,
            o_result => w_RESULT
        );

        process is
            begin
                r_ADD_TERM1 <= "00";
                r_ADD_TERM2 <= "01";
                wait for 10 ns;

                r_ADD_TERM1 <= "01";
                r_ADD_TERM2 <= "10";
                wait for 10 ns;

                r_ADD_TERM1 <= "10";
                r_ADD_TERM2 <= "11";
                wait for 10 ns;

                r_ADD_TERM1 <= "11";
                r_ADD_TERM2 <= "11";
                wait for 10 ns;

            end process;
        end architecture behave;


