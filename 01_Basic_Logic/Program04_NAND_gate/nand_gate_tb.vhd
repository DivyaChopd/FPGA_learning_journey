library ieee;
use ieee.std_logic_1164.all;

entity nand_gate_tb is
end entity nand_gate_tb;

architecture behave of nand_gate_tb is
    signal r_sig1 : std_logic := '0';
    signal r_sig2 : std_logic := '0';
    signal w_result : std_logic;

    component nand_gate is
        port (
            input_1 : in std_logic;
            input_2 : in std_logic;
            nand_output :out std_logic
        );
    end component nand_gate;

    begin
        nand_gate_inst : nand_gate
        port map(
            input_1 => r_sig1,
            input_2 => r_sig2,
            nand_output => w_result
        );

        process is
            begin
                r_sig1 <= '0';
                r_sig2 <= '0';
                wait for 10 ns;
                r_sig1 <= '0';
                r_sig2 <= '1';
                wait for 10 ns;
                r_sig1 <= '1';
                r_sig2 <= '0';
                wait for 10 ns;
                r_sig1 <= '1';
                r_sig2 <= '1';
                wait for 10 ns;
                wait;
            end process;
        end architecture behave;

            