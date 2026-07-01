library ieee;
use ieee.std_logic_1164.all;

entity mux_4_to_1 is
    port(
        i_select : in std_logic_vector(1 downto 0);

        i_data1 : in std_logic;
        i_data2 : in std_logic;
        i_data3 : in std_logic;
        i_data4 : in std_logic;

        o_result : out std_logic
    );
end entity mux_4_to_1 ;

    architecture rtl of mux_4_to_1 is
        begin
        -- Option 1: when else:
            -- o_result <= i_data1 when i_select = "00"
            --       else i_data2 when i_select = "01"
            --       else i_data3 when i_select = "10"
            --       else i_data4;

        -- Option 2: with select statement: 
            -- with i_select select 
            -- o_result <= i_data1 when "00",
            --            i_data2 when "01",
            --            i_data3 when "10",
            --            i_data4 when others;

        -- Option 3: process + case statement:
        p_Mux: process (i_select, i_data1, i_data2, i_data3, i_data4) is 
                begin 
                    case i_select is 
                        when "00" => o_result <= i_data1; 
                        when "01" => o_result <= i_data2; 
                        when "10" => o_result <= i_data3; 
                        when others => o_result <= i_data4;
                    end case;

        end process p_Mux;
    end architecture rtl;
