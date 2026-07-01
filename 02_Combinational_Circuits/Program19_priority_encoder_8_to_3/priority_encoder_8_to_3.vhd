-- =====================================================================================================
-- Module: 8:3 priority encoder
-- Description: Encodes the highest priority active input into 3 bit binary output.
-- Inputs: i_data(7:0) - 8-bit input, i_enabe - active high enable
-- Outputs: o_result(2:0) - 3-bit encoded output, o_valid - valid flag (high when any input is active)
-- Priority: i_data(7)>i_data(6)> . . . i_data(0)
-- =====================================================================================================

library ieee;
use ieee.std_logic_1164.all;

entity priority_encoder_8_to_3 is
    port(
        i_data : in std_logic_vector(7 downto 0);
        i_enable : in std_logic;
        o_result : out std_logic_vector(2 downto 0);
        o_valid : out std_logic
    );
end entity priority_encoder_8_to_3;

architecture rtl of priority_encoder_8_to_3 is
    begin

        p_priority : process(i_data,i_enable) is
            begin
                if i_enable = '1' then

                    if i_data(7) = '1' then o_result <= "111"; o_valid <= '1';
                    elsif i_data(6) = '1' then o_result <= "110"; o_valid <= '1';
                    elsif i_data(5) = '1' then o_result <= "101"; o_valid <= '1';
                    elsif i_data(4) = '1' then o_result <= "100"; o_valid <= '1';
                    elsif i_data(3) = '1' then o_result <= "011"; o_valid <= '1';
                    elsif i_data(2) = '1' then o_result <= "010"; o_valid <= '1';
                    elsif i_data(1) = '1' then o_result <= "001"; o_valid <= '1';
                    elsif i_data(0) = '1' then o_result <= "000"; o_valid <= '1';
                    else o_result <= "000"; o_valid <= '0';
                    end if;

                    
                else  o_result <= "000"; o_valid <= '0';
            end if;
            end process;
        end architecture rtl;