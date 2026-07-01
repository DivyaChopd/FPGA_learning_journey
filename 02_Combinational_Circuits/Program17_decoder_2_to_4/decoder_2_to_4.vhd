-- ==========================================================================
-- Module: 2:4 Decoder
-- Inputs: i_data(1:0), i_enable
-- Outputs: o_result(3:0)
-- ==========================================================================

library ieee;
use ieee.std_logic_1164.all;

entity decoder_2_to_4 is
    port(
        i_data : in std_logic_vector(1 downto 0);
        i_enable : in std_logic;
        --
        o_result : out std_logic_vector(3 downto 0)
    );
end entity decoder_2_to_4;

architecture rtl of decoder_2_to_4 is
    begin
       
-- -----------------------------------------------------------------------------
-- Option 1: Concurrent statement
-- -----------------------------------------------------------------------------

--        o_result1 <= not i_data1 and not i_data2;
--      o_result2 <= not i_data1 and i_data2; 
--      o_result3 <= i_data1 and not i_data2;
--      o_result4 <= i_data1 and i_data2;

-- ----------------------------------------------------------------------------
-- Option 2: Process + case statement
-- ----------------------------------------------------------------------------

        p_decoder : process(i_data, i_enable) is
            begin

                if i_enable ='1' then
                
                case i_data is
                    when "00" => o_result <= "0001";
                    when "01" => o_result <= "0010";
                    when "10" => o_result <= "0100";
		    when "11" => o_result <= "1000";
                    when others => o_result <= "0000";
                end case;


                else o_result <= "0000";
            end if;
        end process;

    end architecture rtl;

    