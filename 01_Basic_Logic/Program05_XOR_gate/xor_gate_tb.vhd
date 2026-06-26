library ieee;
use ieee.std_logic_1164.all;

entity xor_gate_tb is
end entity xor_gate_tb;

architecture behave of xor_gate_tb is
    signal r_sig1 : std_logic := '0';
    signal r_sig2 : std_logic := '0';
    signal w_result : std_logic;

    component xor_gate is
        port(
            input_1 : in std_logic;
            input_2 : in std_logic;
            xor_output : out std_logic
        );
    end component xor_gate;

    begin
    xor_gate_inst : xor_gate
    port map(
        input_1 => r_sig1,
        input_2 => r_sig2,
        xor_output => w_result
    );

    process is 
        begin 
            r_sig1 <= '0';
            r_sig2 <= '0';
            wait for 20 ns;
            r_sig1 <= '0';
            r_sig2 <= '1';
            wait for 20 ns;
            r_sig1 <= '1';
            r_sig2 <= '0';
            wait for 20 ns;
            r_sig1 <= '1';
            r_sig2 <= '1';
            wait for 20 ns;
            wait;
        end process;
    end architecture behave;