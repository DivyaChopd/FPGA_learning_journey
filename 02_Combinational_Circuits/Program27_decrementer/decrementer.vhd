-- ==============================================================
-- Module: n-bit Decrementer
-- Description: Using Structure method (Scalable Ripple Carry Adder is reused)
-- Inputs: i_data(n-1:0)
-- Outputs: o_result(n-1:0)
-- ==============================================================

library ieee;
use ieee.std_logic_1164.all;

entity decrementer is
    generic(
        g_WIDTH : natural
    );
    port(
        i_data : in std_logic_vector(g_WIDTH-1 downto 0);
        --
        o_result : out std_logic_vector(g_WIDTH-1 downto 0)
    );
end entity decrementer;

architecture rtl of decrementer is
    
    signal w_result: std_logic_vector(g_WIDTH downto 0);
    constant c_minus_one : std_logic_vector(g_WIDTH-1 downto 0) := (others =>'1');

    begin
    uut : entity work.ripple_carry_adder
    generic map(
        g_width => g_WIDTH
    )
    port map(
        i_add_term1 => i_data,
        i_add_term2 => c_minus_one,
        o_result => w_result
    );

    o_result <= w_result(g_WIDTH-1 downto 0);


    end architecture rtl;
