-- ===========================================================================
-- Module: 4-bit Carry Lookahead Adder
-- Description: Using structure method
-- Inputs: i_add_term1(3:0), i_add_term2(3:0)
-- Outputs: o_result(4:0)
-- Wires: w_GENERATE(3:0), w_PROPOGATE(3:0), w_CARRY(4:0), w_SUM(3:0)
-- ===========================================================================

library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_adder_4_bit is
    port(
        i_add_term1 : in std_logic_vector(3 downto 0);
        i_add_term2 : in std_logic_vector(3 downto 0);
        --
        o_result : out std_logic_vector(4 downto 0)
    );
end entity carry_lookahead_adder_4_bit;

architecture rtl of carry_lookahead_adder_4_bit is
    signal w_GENERATE : std_logic_vector(3 downto 0);
    signal w_PROPOGATE : std_logic_vector(3 downto 0);
    signal w_CARRY : std_logic_vector(4 downto 0);
    signal w_SUM : std_logic_vector(3 downto 0);

    begin
        uut_FA1: entity work.full_adder
        port map(
            i_bit1 => i_add_term1(0),
            i_bit2 => i_add_term2(0),
            i_carry => w_CARRY(0),
            o_sum => w_SUM(0),
            o_carry => open      -- because we are not using the carry generated from full_adder
        );

        uut_FA2: entity work.full_adder
        port map(
            i_bit1 => i_add_term1(1),
            i_bit2 => i_add_term2(1),
            i_carry => w_CARRY(1),
            o_sum => w_SUM(1),
            o_carry => open
        );

        uut_FA3: entity work.full_adder
        port map(
            i_bit1 => i_add_term1(2),
            i_bit2 => i_add_term2(2),
            i_carry => w_CARRY(2),
            o_sum => w_SUM(2),
            o_carry => open
        );

        uut_FA4: entity work.full_adder
        port map(
            i_bit1 => i_add_term1(3),
            i_bit2 => i_add_term2(3),
            i_carry => w_CARRY(3),
            o_sum => w_SUM(3),
            o_carry => open
        );

-- -------------------------------------------------------------
-- Create the Generate Terms:  Gi=Ai*Bi
-- -------------------------------------------------------------

        w_GENERATE(0) <= i_add_term1(0) and i_add_term2(0);
        w_GENERATE(1) <= i_add_term1(1) and i_add_term2(1);
        w_GENERATE(2) <= i_add_term1(2) and i_add_term2(2);
        w_GENERATE(3) <= i_add_term1(3) and i_add_term2(3);

-- -------------------------------------------------------------
-- Create the Propogate Terms:  Pi=Ai+Bi
-- -------------------------------------------------------------

        w_PROPOGATE(0) <= i_add_term1(0) or i_add_term2(0);
        w_PROPOGATE(1) <= i_add_term1(1) or i_add_term2(1);
        w_PROPOGATE(2) <= i_add_term1(2) or i_add_term2(2);
        w_PROPOGATE(3) <= i_add_term1(3) or i_add_term2(3);

-- -------------------------------------------------------------
-- Create the Carry Terms: Ci+1=Gi+Pi*Ci 
-- -------------------------------------------------------------

        w_CARRY(0) <= '0';
        w_CARRY(1) <= w_GENERATE(0) or (w_PROPOGATE(0) and w_CARRY(0));
        w_CARRY(2) <= w_GENERATE(1) or (w_PROPOGATE(1) and w_CARRY(1));
        w_CARRY(3) <= w_GENERATE(2) or (w_PROPOGATE(2) and w_CARRY(2));
        w_CARRY(4) <= w_GENERATE(3) or (w_PROPOGATE(3) and w_CARRY(3));

-- -------------------------------------------------------------
-- Final result
-- -------------------------------------------------------------

        o_result <= w_CARRY(4) & w_SUM;
    end architecture rtl;