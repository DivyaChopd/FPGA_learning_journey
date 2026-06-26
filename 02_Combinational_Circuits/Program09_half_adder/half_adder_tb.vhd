library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end entity half_adder_tb;

architecture behave of half_adder_tb is
    
    signal sig1 : std_logic := '0';
    signal sig2 : std_logic := '0';
    signal sum_output : std_logic;
    signal carry_output :std_logic;

begin
  uut : entity work.half_adder
  port map(
    input_1 => sig1,
    input_2 => sig2,
    sum => sum_output,
    carry => carry_output
  );

    process is
    begin
        sig1 <= '0';
        sig2 <= '0';
        wait for 20 ns;
        sig1 <= '0';
        sig2 <= '1';
        wait for 20 ns;
        sig1 <= '1';
        sig2 <= '0';
        wait for 20 ns;
        sig1 <= '1';
        sig2 <= '1';
        wait for 20 ns;
    end process;
end architecture behave;

