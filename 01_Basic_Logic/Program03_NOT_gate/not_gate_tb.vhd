library ieee;
use ieee.std_logic_1164.all;

entity not_gate_tb is
end not_gate_tb;

architecture behave of not_gate_tb is
    signal r_sig : std_logic := '0';
    signal w_result : std_logic;

    component not_gate is
        port (
            input : in std_logic;
            output : out std_logic
        );
    end component not_gate;

    begin
        not_gate_inst : not_gate
        port map(
            input => r_sig,
            output => w_result
        );

        process is
            begin
                r_sig <= '0';
                wait for 10 ns;
                r_sig <= '1';
                wait for 10 ns;
                wait;
            end process;
        end behave;