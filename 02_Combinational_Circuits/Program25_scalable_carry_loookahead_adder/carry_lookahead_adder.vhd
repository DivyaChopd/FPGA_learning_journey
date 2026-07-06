-- ==========================================================================
-- Module: Scalable Carry lookahead Adder
-- Desription : Using structure (generic and generate)
-- Inputs: i_add_term1(n:0), i_add_term2(n:0)
-- Outputs: o_result(n+1:0)
-- Wires: w_GENERATE(n:0), w_PROPOGATE(n:0), w_SUM(n:0), w_CARRY(n+1:0)
-- ==========================================================================

library ieee;
use ieee.std_logic_1164.all;

entity carry_lookahead_adder is
    generic(
        g_WIDTH : natural
    );
    port(
        i_add_term1 : in std_logic_vector(g_WIDTH-1 downto 0);
        i_add_term2 : in std_logic_vector(g_WIDTH-1 downto 0);
        --
        o_result : out std_logic_vector(g_WIDTH downto 0)
    );
end entity carry_lookahead_adder;

architecture rtl of carry_lookahead_adder is 
    signal w_GENERATE : std_logic_vector(g_WIDTH-1 downto 0);
    signal w_PROPOGATE : std_logic_vector(g_WIDTH-1 downto 0);
    signal w_SUM : std_logic_vector(g_WIDTH-1 downto 0);
    signal w_CARRY : std_logic_vector(g_WIDTH downto 0);

    begin
        w_CARRY(0) <='0';

        gen_FULL_ADDERS : for i in 0 to g_WIDTH-1 generate

        uut: entity work.full_adder
        port map(
            i_bit1 => i_add_term1(i),
            i_bit2 => i_add_term2(i),
            i_carry => w_CARRY(i),
            o_sum => w_SUM(i),
            o_carry => open
        );
    end generate gen_FULL_ADDERS;

-- -------------------------------------------------------------
-- Create the Generate Terms:  Gi=Ai*Bi
-- Create the Propogate Terms:  Pi=Ai+Bi
-- Create the Carry Terms: Ci+1=Gi+Pi*Ci 
-- -------------------------------------------------------------

    gen_CLA : for j in 0 to g_WIDTH-1 generate
    w_GENERATE(j) <= i_add_term1(j) and i_add_term2(j);
    w_PROPOGATE(j) <= i_add_term1(j) or i_add_term2(j);
    w_CARRY(j+1) <= w_GENERATE(j) or (w_PROPOGATE(j) and  w_CARRY(j) );
    end generate gen_CLA;

-- -------------------------------------------------------------
-- Final result
-- -------------------------------------------------------------

    o_result <= w_CARRY(g_width) & w_SUM;
    
end architecture rtl;