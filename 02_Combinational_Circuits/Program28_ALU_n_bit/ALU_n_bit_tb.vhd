-- =========================================================================
-- Testbench: N-bit ALU

-- =========================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_n_bit_tb is
end entity ALU_n_bit_tb ;

architecture behave of ALU_n_bit_tb is
    constant c_WIDTH : natural := 4;

    signal r_INPUT1 : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
    signal r_INPUT2 : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
    signal r_CARRY : std_logic := '0';
    signal r_OPCODE : std_logic_vector(3 downto 0);
    --
    signal w_RESULT : std_logic_vector(c_WIDTH-1 downto 0);
    signal w_CARRY : std_logic;
    signal w_OVERFLOW : std_logic;

    begin
        uut: entity work.ALU_n_bit
        generic map (
            c_WIDTH => c_width
        )
        port map(
            i_input1 => r_INPUT1,
            i_input2 => r_INPUT2,
            i_carry => r_CARRY,
            i_opcode => r_OPCODE,
            o_result => w_RESULT,
            o_carry => w_CARRY,
            o_overflow => w_OVERFLOW
            );

        process is
            begin
                
                for i in 0 to 15 loop
                    r_OPCODE <= std_logic_vector(to_unsigned(i,4));
                    r_INPUT1 <= "1111";
                    r_INPUT2 <= "1111";
		            wait for 20 ns;
                    end loop;

            end process;
        end architecture behave;
                    
