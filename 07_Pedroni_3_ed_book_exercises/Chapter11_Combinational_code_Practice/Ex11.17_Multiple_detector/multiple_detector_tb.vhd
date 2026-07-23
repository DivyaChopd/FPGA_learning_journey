-- ======================================================================================
-- Testbench: Multiple detector
-- ======================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiple_detector_tb is
end entity multiple_detector_tb;

architecture behave of multiple_detector_tb is
    constant c_BITS : natural :=5;
    signal r_A,r_B : std_logic_vector(c_BITS-1 downto 0) := (others => '1');
    signal w_is_multiple, w_invalid_input: std_logic;

    begin
        uut: entity work.multiple_detector
        generic map(c_BITS)
        port map(r_A,r_B,w_is_multiple,w_invalid_input);

    process 
    begin
        r_A <= "11111";
        r_B <= "00011";
        wait for 80 ns;

        r_A <= "00000";
        r_B <= "00011";
        wait for 80 ns;

        r_A <= "10011";
        r_B <= "00000";
        wait for 80 ns;

        r_A <= "01100";
        r_B <= "00011";
        wait for 80 ns;

        r_A <= "01110";
        r_B <= "00011";
        wait for 80 ns;


        wait;
    end process;
end architecture behave;



