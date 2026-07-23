-- ==================================================
-- Testbench: Address Decoder
-- ==================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

entity address_decoder_tb is
end entity address_decoder_tb;

architecture behave of address_decoder_tb is
    constant c_NUM_BITS : integer := 3;
    --
    signal A : std_logic_vector(c_NUM_BITS-1 downto 0);
    signal EN : std_logic := '1';
    signal B : std_logic_vector((2**c_NUM_BITS)-1 downto 0);

    begin
        uut: entity work.address_decoder 
        generic map(c_NUM_BITS)
        port map(A,EN,B);

    p_EN: process
    begin
        wait for 200 ns;
        EN <= '0';
        wait for 20 ns;
    end process p_EN;

    p_A: process
    begin
        for i in 0 to (2**c_NUM_BITS)-1 loop
            A <= to_std_logic_vector(i,c_NUM_BITS);
            wait for 20 ns;
        end loop;
        wait;
    end process p_A;

end architecture behave;
