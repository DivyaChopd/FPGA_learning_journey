--====================================================================================
-- Module: 4-to-2 encoder
-- Description: Converts one active input into a 2-bit output.
--====================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity encoder_4_to_2 is
    port(
        i_data: in std_logic_vector(3 downto 0);
        i_select : in std_logic;
        o_result : out std_logic_vector(1 downto 0)
    );
end entity;

    architecture rtl of encoder_4_to_2 is
        begin

            p_encoder: process (i_select, i_data) is
                begin
                    if i_select = '1' then
                    case i_data is
                        when "0001" => o_result <= "00";
                        when "0010" => o_result <= "01";
                        when "0100" => o_result <= "10";
                        when "1000" => o_result <= "11";
			when others => o_result <= "00";
			end case;

                    else 
                        o_result <= "00";
                    end if;
            end process p_encoder;
    end architecture rtl;

