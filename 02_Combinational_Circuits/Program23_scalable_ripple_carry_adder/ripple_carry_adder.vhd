-- =============================================================================
-- Module: Scalable Ripple Carry Adder
-- Description : Using generic and generate statement.
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder is
    generic(
        g_width : natural := 2
    );

    port(
        i_add_term1 : in std_logic_vector(g_width-1 downto 0);
        i_add_term2 : in std_logic_vector(g_width-1 downto 0);
        --
        o_result : out std_logic_vector(g_width downto 0)
    );
end entity ripple_carry_adder;

architecture rtl of ripple_carry_adder is

    signal w_CARRY : std_logic_vector(g_width downto 0);
    signal w_SUM : std_logic_vector(g_width-1 downto 0);

    begin
         w_CARRY(0) <='0';
        GEN_WIDTH : for i in 0 to g_width-1 generate

            uut: entity work.full_adder
            port map(
                i_bit1 => i_add_term1(i),
                i_bit2 => i_add_term2(i),
                i_carry => w_CARRY(i),
                o_sum => w_SUM(i),
                o_carry => w_CARRY(i+1)
            );
        end generate GEN_WIDTH;

        o_result <= w_CARRY(g_width) & w_SUM;

end architecture rtl;
