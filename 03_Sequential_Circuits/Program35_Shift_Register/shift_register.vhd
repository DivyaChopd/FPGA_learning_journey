-- ============================================================================
-- Module: N-bit Shift register
-- Inputs: 2 -> din, clk
-- Outputs: 1 -> dout
-- Constants: 2 -> NUM_STAGES, NUM_BITS
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    generic(
        NUM_STAGES : natural;
        NUM_BITS : natural);
    port(
        clk : in std_logic;
        din : in std_logic_vector(NUM_BITS-1 downto 0);
        dout : out std_logic_vector(NUM_BITS-1 downto 0));
end entity shift_register;

architecture rtl of shift_register is
    type array_sr is array (0 to NUM_STAGES-1) of std_logic_vector(NUM_BITS-1 downto 0);
    signal q: array_sr;
    begin

        process(clk)
        begin
            if rising_edge(clk) then
            q <= din & q(0 to NUM_STAGES-2);
            end if;
	    dout <= q(NUM_STAGES-1);
            end process;

end architecture rtl;


