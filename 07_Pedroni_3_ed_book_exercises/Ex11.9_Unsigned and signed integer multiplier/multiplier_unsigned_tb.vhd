-- ==================================================================================
-- Testbench: Unsigned and signed integer multiplier
-- Description: Results check only for unsigned values and input is given in decimal
-- ==================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_unsigned_tb is
end entity multiplier_unsigned_tb;

architecture behave of multiplier_unsigned_tb is
    constant c_BITS : natural := 4;
    signal r_A,r_B : std_logic_vector(c_BITS-1 downto 0);
    signal w_PROD_UNS : std_logic_vector((2*c_BITS)-1 downto 0);

    begin
        uut: entity work.multiplier
        generic map(c_BITS)
        port map(r_A,r_B,w_PROD_UNS);

        process 
        begin
            r_A <= std_logic_vector(to_unsigned(7,c_BITS));
            r_B <= std_logic_vector(to_unsigned(8,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_unsigned(7,c_BITS));
            r_B <= std_logic_vector(to_unsigned(6,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_unsigned(8,c_BITS));
            r_B <= std_logic_vector(to_unsigned(8,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_unsigned(8,c_BITS));
            r_B <= std_logic_vector(to_unsigned(15,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_unsigned(8,c_BITS));
            r_B <= std_logic_vector(to_unsigned(7,c_BITS));
            wait for 80 ns; 

            wait;
        end process;
    end architecture behave;


