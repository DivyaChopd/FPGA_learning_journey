-- ===================================================================================
-- Module: Generic N-bit Multiplexer
-- Inputs: 2 -> data_in, sel
-- Outputs: 1 -> data_out
-- Constants: 2 -> NUM_INPUTS, NUM_BITS
-- Description: NUM_INPUTS (number of inputs), NUM_BITS (width of each input)
-- ===================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity mux_n_bit is
    generic(
        NUM_INPUTS : natural := 8;
        NUM_BITS : natural := 4 
    );
    port(
        i_data_in : in std_logic_vector(NUM_INPUTS*NUM_BITS-1 downto 0);
        i_sel : in natural range 0 to NUM_INPUTS-1;
        -- 
        o_data_out : out std_logic_vector(NUM_BITS-1 downto 0)
    );
end entity mux_n_bit;

architecture rtl of mux_n_bit is
    begin
        o_data_out <= i_data_in ((i_sel+1)*NUM_BITS-1 downto i_sel*NUM_BITS);
end architecture rtl;