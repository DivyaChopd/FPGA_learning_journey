-- =======================================================================================
-- Module: Address Decoder
-- Inputs: 2 -> a, en
-- Output: 1 -> b
-- Constants: 2 -> NUM_BITS -> Number of input bits , NUM_OUT - Number of output bits
-- =======================================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity address_decoder is
    generic(
        NUM_BITS : integer := 3
    );
    port(
        a : in std_logic_vector(NUM_BITS-1 downto 0);
        en : in std_logic := '1';
        --
        b : out std_logic_vector((2**NUM_BITS)-1 downto 0)
    );
end entity address_decoder;

architecture rtl of address_decoder is
    begin
    g_ad : for i in 0 to (2**NUM_BITS)-1 generate
    begin
    b(i) <= en when a = to_std_logic_vector(i,NUM_BITS)
    else '0';
    end generate g_ad;
        
    end architecture rtl;