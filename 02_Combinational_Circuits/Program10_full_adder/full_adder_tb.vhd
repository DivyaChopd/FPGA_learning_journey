library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end entity full_adder_tb;

architecture behave of full_adder_tb is
    signal r_BIT1 : std_logic := '0';
    signal r_BIT2 : std_logic := '0';
    signal r_CARRY : std_logic := '0';
    signal w_SUM : std_logic;
    signal w_CARRY : std_logic;

    begin
        uut : entity work.full_adder
        port map(
            i_bit1 => r_BIT1,
            i_bit2 => r_BIT2,
            i_carry => r_CARRY,
            o_sum => w_SUM,
            o_carry => w_CARRY   
        );

        process is
            begin
                r_BIT1 <= '0';
                r_BIT2 <= '0';
                r_CARRY <= '0';
                wait for 10 ns;

                r_BIT1 <= '0';
                r_BIT2 <= '0';
                r_CARRY <= '1';
                wait for 10 ns;
                
                r_BIT1 <= '0';
                r_BIT2 <= '1';
                r_CARRY <= '0';
                wait for 10 ns;
                
                r_BIT1 <= '0';
                r_BIT2 <= '1';
                r_CARRY <= '1';
                wait for 10 ns;
                

                r_BIT1 <= '1';
                r_BIT2 <= '0';
                r_CARRY <= '0';
                wait for 10 ns;
                
                r_BIT1 <= '1';
                r_BIT2 <= '0';
                r_CARRY <= '1';
                wait for 10 ns;
                
                r_BIT1 <= '1';
                r_BIT2 <= '1';
                r_CARRY <= '0';
                wait for 10 ns;
                
                r_BIT1 <= '1';
                r_BIT2 <= '1';
                r_CARRY <= '1';
                wait for 10 ns;

                wait;
            end process;
        end architecture behave;