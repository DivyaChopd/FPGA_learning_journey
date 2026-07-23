-- ==================================================================================
-- Testbench: Unsigned and signed integer multiplier
-- Description: Results check only for signed values and input is given in decimal
-- ==================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_signed_tb is
end entity multiplier_signed_tb;

architecture behave of multiplier_signed_tb is
    constant c_BITS : natural := 4;
    signal r_A,r_B : std_logic_vector(c_BITS-1 downto 0);
    signal w_PROD_SIG : std_logic_vector((2*c_BITS)-1 downto 0);

    begin
        uut: entity work.multiplier
        generic map(c_BITS)
        port map(a => r_A,
                b => r_B,
                prod_sig => w_PROD_SIG);

        process 
        begin
            r_A <= std_logic_vector(to_signed(7,c_BITS));
            r_B <= std_logic_vector(to_signed(8,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_signed(7,c_BITS));
            r_B <= std_logic_vector(to_signed(6,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_signed(8,c_BITS));
            r_B <= std_logic_vector(to_signed(8,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_signed(8,c_BITS));
            r_B <= std_logic_vector(to_signed(15,c_BITS));
            wait for 80 ns;

            r_A <= std_logic_vector(to_signed(8,c_BITS));
            r_B <= std_logic_vector(to_signed(7,c_BITS));
            wait for 80 ns; 

            wait;
        end process;
    end architecture behave;


