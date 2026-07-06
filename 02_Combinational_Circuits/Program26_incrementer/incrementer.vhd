-- ============================================================================
-- Module: n-bit Incrementer
-- Description: Using Structure method (Scalable Ripple Carry Adder is used)
-- Inputs: 
-- Outputs:
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity incrementer is
    generic(
        g_width : natural
    );
    port(
        i_data : in std_logic_vector(g_width-1 downto 0);
        --
        o_incrementer : out std_logic_vector(g_width-1 downto 0)
    );
end entity incrementer;

architecture rtl of incrementer is
        constant c_one : std_logic_vector(g_width-1 downto 0) := (0 => '1', others => '0');
	signal w_incrementer : std_logic_vector(g_width downto 0);
	
	begin
        uut: entity work.ripple_carry_adder 
        generic map(
            g_width => g_width
        )
        port map(
            i_add_term1 => i_data,
            i_add_term2  => c_one,
            o_result => w_incrementer
        );

        o_incrementer <= w_incrementer(g_width-1 downto 0);

    end architecture rtl;
