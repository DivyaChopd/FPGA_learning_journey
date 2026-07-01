-- ============================================================================
-- Module: 2-bit Ripple Carry Adder
-- Description: For multi bit addition.
-- Code: Structural VHDL
-- Inputs: i_add_term1(1:0), i_add_term2(1:0)
-- Outputs: o_result(2:0)
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder_2_FA is
    port(
            i_add_term1 : in std_logic_vector(1 downto 0);
            i_add_term2 : in std_logic_vector(1 downto 0);
            --
            o_result : out std_logic_vector(2 downto 0) -- output has extra bit because result could be bigger than inputs
    );
end entity ripple_carry_adder_2_FA;

architecture rtl of ripple_carry_adder_2_FA is

    signal w_CARRY : std_logic_vector(2 downto 0);
    signal w_SUM : std_logic_vector (1 downto 0);

    begin
        w_CARRY(0) <='0';
            FA1_INST: entity work.full_adder
            port map (
                i_bit1 => i_add_term1(0),
                i_bit2 => i_add_term2(0),
                i_carry => w_CARRY(0),
                o_sum => w_SUM(0),
                o_carry => w_CARRY(1)
            );

            FA2_INST: entity work.full_adder
            port map (
                i_bit1 => i_add_term1(1),
                i_bit2 => i_add_term2(1),
                i_carry => w_CARRY(1),
                o_sum => w_SUM(1),
                o_carry => w_CARRY(2)
            );

            o_result <= w_CARRY(2) & w_SUM;

    end architecture rtl;